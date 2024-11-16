import tkinter as tk
from tkinter import Canvas, OptionMenu, StringVar, Toplevel, messagebox, Radiobutton, Label, Frame
from PIL import Image, ImageTk

class TransitOptimizerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Bangkok Transit Optimizer")
        self.root.geometry("850x650")
        self.root.configure(bg="#ffffff")  # Set background color for the main window

        # Menu bar
        menu_bar = tk.Menu(root)
        root.config(menu=menu_bar)

        # View menu for toggling the panel
        view_menu = tk.Menu(menu_bar, tearoff=0)
        menu_bar.add_cascade(label="View", menu=view_menu)
        self.view_menu = view_menu  # Store the view menu to later modify the label dynamically
        view_menu.add_command(label="Hide Panel", command=self.toggle_panel)

        # Main panel frame containing all widgets (initially at the bottom)
        self.is_expanded = True
        self.panel_frame = Frame(root, bg="#ffffff")
        self.panel_frame.pack(side="bottom", pady=10, fill="x")

        # Title label
        title_label = Label(self.panel_frame, text="Bangkok Transit Optimizer", font=("Arial", 16, "bold"), bg="#ffffff", fg="#333333")
        title_label.pack(pady=10)

        # Instructions label
        instructions_label = Label(self.panel_frame, text="Select a start and destination point, then choose route preference", 
                                   font=("Arial", 10), bg="#ffffff", fg="#555555")
        instructions_label.pack(pady=5)

        # Display selected start and destination points
        self.selected_start_label = Label(self.panel_frame, text="Start Point: Not selected", font=("Arial", 10), bg="#ffffff", fg="#333333")
        self.selected_start_label.pack(pady=5)

        self.selected_destination_label = Label(self.panel_frame, text="Destination: Not selected", font=("Arial", 10), bg="#ffffff", fg="#333333")
        self.selected_destination_label.pack(pady=5)

        # Button frame for positioning
        button_frame = Frame(self.panel_frame, bg="#ffffff")
        button_frame.pack(pady=5)

        # Start and Destination Buttons
        start_button = tk.Button(button_frame, text="Select Start Point", command=self.select_start_point,
                                 bg="#007acc", fg="white", font=("Arial", 10), width=15, relief="flat", padx=5)
        start_button.grid(row=0, column=0, padx=5)

        destination_button = tk.Button(button_frame, text="Select Destination", command=self.select_destination_point,
                                       bg="#007acc", fg="white", font=("Arial", 10), width=15, relief="flat", padx=5)
        destination_button.grid(row=0, column=1, padx=5)

        # Zoom In and Zoom Out Buttons
        zoom_in_button = tk.Button(button_frame, text="+", command=lambda: self.zoom_manual(1.1),
                                   bg="#4CAF50", fg="white", font=("Arial", 10, "bold"), width=5, relief="flat")
        zoom_in_button.grid(row=0, column=2, padx=5)

        zoom_out_button = tk.Button(button_frame, text="-", command=lambda: self.zoom_manual(0.9),
                                    bg="#4CAF50", fg="white", font=("Arial", 10, "bold"), width=5, relief="flat")
        zoom_out_button.grid(row=0, column=3, padx=5)

        # Calculation Button
        calc_button = tk.Button(self.panel_frame, text="Calculate Route", command=self.calculate_route,
                                bg="#ff8c00", fg="white", font=("Arial", 12, "bold"), width=20, relief="flat")
        calc_button.pack(pady=15)

        # Map Canvas for displaying the map image with zoom and pan
        self.map_canvas = Canvas(root, width=700, height=400, bg="#f2f2f2", highlightthickness=2, highlightbackground="#cccccc")
        self.map_canvas.pack(fill="both", expand=True, padx=20, pady=10)

        # Load and display the map image
        # map_image = Image.open(r"C:\Users\Acer\Documents\AI-Bangkok-Transit-Optimizer\frontend\images\map.jpg")
        map_image = Image.open("frontend\images\map.jpg")
        self.original_image = map_image
        self.map_image_tk = ImageTk.PhotoImage(map_image)
        self.map_image_id = self.map_canvas.create_image(0, 0, image=self.map_image_tk, anchor="nw")

        # Variables for panning and zooming
        self.map_canvas.bind("<ButtonPress-1>", self.start_pan)
        self.map_canvas.bind("<B1-Motion>", self.pan_image)
        self.map_canvas.bind("<ButtonRelease-1>", self.end_pan)
        self.map_canvas.bind("<MouseWheel>", self.zoom)

        # Track the zoom level and pan offsets
        self.zoom_level = 1.0
        self.pan_x = 0
        self.pan_y = 0

        # Variables for selected stations
        self.start_point = None
        self.destination_point = None
        self.dropdown_var_start = StringVar()
        self.dropdown_var_destination = StringVar()

        # Initialize choice variable for route calculation
        self.choice_var = tk.StringVar(value="least_cost")  # Default choice

    def toggle_panel(self):
        """Toggles the visibility of the main panel."""
        if self.is_expanded:
            self.panel_frame.pack_forget()  # Hide the panel
            self.view_menu.entryconfig("Hide Panel", label="Show Panel")  # Update the menu text to 'Show Panel'
        else:
            self.panel_frame.pack(side="bottom", pady=10, fill="x")  # Show the panel
            self.view_menu.entryconfig("Show Panel", label="Hide Panel")  # Update the menu text to 'Hide Panel'

        self.is_expanded = not self.is_expanded  # Toggle the state

    def select_start_point(self):
        self.show_transit_options("Select Start Point Line", "start")

    def select_destination_point(self):
        self.show_transit_options("Select Destination Point Line", "destination")

    def show_transit_options(self, title, point_type):
        transit_window = Toplevel(self.root)
        transit_window.title(title)
        transit_window.geometry("320x250")
        transit_window.configure(bg="#ffffff")
        transit_window.resizable(False, False)

        # Label for selection type
        tk.Label(transit_window, text=title, font=("Arial", 14, "bold"), bg="#ffffff", fg="#333333").pack(pady=10)

        # Transit Lines with mutual exclusion using Radiobuttons
        lines = {
            "BTS": ["Station 1", "Station 2", "Station 3"],
            "MRT": ["Station A", "Station B", "Station C"],
            "Airport Rail Link": ["Station X", "Station Y", "Station Z"],
            "Red Line": ["Station R1", "Station R2", "Station R3"]
        }

        self.selected_line_var = tk.StringVar()
        self.selected_line_var.set(None)

        for line, stations in lines.items():
            radio_button = tk.Radiobutton(
                transit_window,
                text=line,
                variable=self.selected_line_var,
                value=line,
                command=lambda l=line, s=stations: self.update_dropdown(l, s, transit_window, point_type),
                bg="#ffffff",
                font=("Arial", 10),
                fg="#333333",
                activebackground="#e6e6e6"
            )
            radio_button.pack(anchor="w", padx=20)

    def update_dropdown(self, selected_line, stations, parent, point_type):
        
        if self.selected_line_var.get() == "BTS": 
            if hasattr(self, 'dropdown_color_select') and self.dropdown_color_select is not None:
                self.dropdown_color_select.destroy()
            options = ["Light Green", "Dark Green", "Gold"]
            self.dropdown_color_var = tk.StringVar(value='Select Line Color')
            self.dropdown_color_select = OptionMenu(parent, self.dropdown_color_var, *options)
            self.dropdown_color_select.pack(anchor="w", padx=20)
        elif self.selected_line_var.get() == "MRT":
            if hasattr(self, 'dropdown_color_select') and self.dropdown_color_select is not None:
                self.dropdown_color_select.destroy()
            options = ["Blue", 'Purple', 'Yellow', 'Pink']
            self.dropdown_color_var = tk.StringVar(value='Select Line Color')
            self.dropdown_color_select = OptionMenu(parent, self.dropdown_color_var, *options)
            self.dropdown_color_select.pack(anchor="w", padx=20)
        else:
            if hasattr(self, 'dropdown_color_select') and self.dropdown_color_select is not None:
                self.dropdown_color_select.destroy()
        if point_type == "start":
            if hasattr(self, 'dropdown_menu_start') and self.dropdown_menu_start is not None:
                self.dropdown_menu_start.destroy()
            self.dropdown_var_start.set("Select Station")
            self.dropdown_menu_start = OptionMenu(parent, self.dropdown_var_start, *stations)
            self.dropdown_menu_start.config(bg="#e0e0e0", font=("Arial", 10), width=20)
            self.dropdown_menu_start.pack(anchor="w", padx=20)
            self.start_point = self.dropdown_var_start
            self.dropdown_var_start.trace("w", lambda *args: self.selected_start_label.config(
                text=f"Start Point: {selected_line} - {self.dropdown_var_start.get()}"
            ))

        elif point_type == "destination":
            if hasattr(self, 'dropdown_menu_destination') and self.dropdown_menu_destination is not None:
                self.dropdown_menu_destination.destroy()
            self.dropdown_var_destination.set("Select Station")
            self.dropdown_menu_destination = OptionMenu(parent, self.dropdown_var_destination, *stations)
            self.dropdown_menu_destination.config(bg="#e0e0e0", font=("Arial", 10), width=20)
            self.dropdown_menu_destination.pack(anchor="w", padx=20)
            self.destination_point = self.dropdown_var_destination
            self.dropdown_var_destination.trace("w", lambda *args: self.selected_destination_label.config(
                text=f"Destination: {selected_line} - {self.dropdown_var_destination.get()}"
            ))

    def start_pan(self, event):
        self.map_canvas.config(cursor="fleur")
        self.pan_x = event.x
        self.pan_y = event.y

    def pan_image(self, event):
        dx = event.x - self.pan_x
        dy = event.y - self.pan_y
        self.map_canvas.move(self.map_image_id, dx, dy)
        self.pan_x = event.x
        self.pan_y = event.y

    def end_pan(self, event):
        self.map_canvas.config(cursor="hand2")

    def zoom(self, event):
        if event.delta > 0:
            self.zoom_level *= 1.1
        elif event.delta < 0:
            self.zoom_level /= 1.1
        self.zoom_level = max(0.1, min(self.zoom_level, 10))
        self.update_image()

    def zoom_manual(self, scale):
        self.zoom_level *= scale
        self.zoom_level = max(0.1, min(self.zoom_level, 10))
        self.update_image()

    def update_image(self):
        width, height = self.original_image.size
        new_size = (int(width * self.zoom_level), int(height * self.zoom_level))
        resized_image = self.original_image.resize(new_size, Image.LANCZOS)
        self.map_image_tk = ImageTk.PhotoImage(resized_image)
        self.map_canvas.itemconfig(self.map_image_id, image=self.map_image_tk)
        self.map_canvas.coords(self.map_image_id, 0, 0)

    def calculate_route(self):
        if self.dropdown_var_start.get() == "Select Station" or self.dropdown_var_destination.get() == "Select Station":
            messagebox.showwarning("Warning", "Please select both a start and destination station.")
        else:
            self.show_choice_window()

    def show_choice_window(self):
        choice_window = Toplevel(self.root)
        choice_window.title("Select Route Preference")
        choice_window.geometry("300x200")
        choice_window.configure(bg="#ffffff")
        choice_window.resizable(False, False)

        tk.Label(choice_window, text="Choose Route Preference", font=("Arial", 12, "bold"),
                 bg="#ffffff", fg="#333333").pack(pady=10)

        options = [
            ("Least Cost", "least_cost"),
            ("Least Station Changes", "least_station_changes"),
            ("Least Cost and Station Changes", "least_cost_and_changes")
        ]

        for text, value in options:
            Radiobutton(choice_window, text=text, variable=self.choice_var, value=value,
                        font=("Arial", 10), bg="#ffffff", anchor="w").pack(fill="x", padx=20, pady=5)

        tk.Button(choice_window, text="Confirm", command=lambda: [self.process_choice(), choice_window.destroy()],
                  bg="#007acc", fg="white", font=("Arial", 10, "bold")).pack(pady=15)

    def process_choice(self):
        self.show_detailed_result()

    def show_detailed_result(self):
        result_window = Toplevel(self.root)
        result_window.title("Route Calculation Result")
        result_window.geometry("400x300")
        result_window.configure(bg="#ffffff")
        result_window.resizable(False, False)

        route_steps = [
            {"station": "Station 1", "line": "BTS"},
            {"station": "Station 2", "line": "BTS"},
            {"station": "Station A", "line": "MRT", "change_line": True},
            {"station": "Station B", "line": "MRT"},
            {"station": "Station X", "line": "Airport Rail Link", "change_line": True},
            {"station": "Station Y", "line": "Airport Rail Link"},
        ]

        for step in route_steps:
            if "change_line" in step:
                Label(result_window, text=f"Change to {step['line']} Line", font=("Arial", 10, "italic"),
                      bg="#ffffff", fg="#666666").pack(anchor="w", padx=20, pady=5)
            Label(result_window, text=f"Station: {step['station']} ({step['line']} Line)",
                  font=("Arial", 10), bg="#ffffff", fg="#333333").pack(anchor="w", padx=20, pady=2)

        total_cost = 120  # Mock total cost
        Label(result_window, text=f"Total Cost: {total_cost} Baht", font=("Arial", 12, "bold"),
              bg="#ffffff", fg="#007acc").pack(anchor="w", padx=20, pady=15)

if __name__ == "__main__":
    root = tk.Tk()
    app = TransitOptimizerApp(root)
    root.mainloop()
