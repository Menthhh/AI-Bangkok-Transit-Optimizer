## main program ##

import sys
import os
import webbrowser

# Add the project root to sys.path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import tkinter as tk
from tkinter import Canvas, OptionMenu, StringVar, Toplevel, messagebox, Radiobutton, Label, Frame
from PIL import Image, ImageTk
from kernel.LookUpTable import LookUpTable
from kernel.PrologTrainQuery import PrologTrainQuery    
from kernel.GmapsBrowser import GmapsBrowser

class TransitOptimizerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Bangkok Transit Optimizer")
        self.root.geometry("1920x1080")
        self.root.configure(bg="#ffffff")  # Set background color for the main window
        self.lookUpTable = LookUpTable()
        self.prologTrainQuery = PrologTrainQuery() 
        self.gmapsBrowser = GmapsBrowser(self.lookUpTable)

        self.prologTrainQuery.set_consult_file("./backend/train_sys_win_age.pl")
        

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

        self.selected_line_var = tk.StringVar()
        self.selected_line_var.set(None)

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
        # self.map_canvas = Canvas(root, width=700, height=400, bg="#f2f2f2", highlightthickness=2, highlightbackground="#cccccc")
        # self.map_canvas.pack(fill="both", expand=True, padx=20, pady=10)

        # # Load and display the map image
        # # map_image = Image.open(r"C:\Users\Acer\Documents\AI-Bangkok-Transit-Optimizer\frontend\images\map.jpg")
        # map_image = Image.open("frontend\images\map.jpg")
        # self.original_image = map_image
        # self.map_image_tk = ImageTk.PhotoImage(map_image)
        # self.map_image_id = self.map_canvas.create_image(0, 0, image=self.map_image_tk, anchor="nw")

        # # Variables for panning and zooming
        # self.map_canvas.bind("<ButtonPress-1>", self.start_pan)
        # self.map_canvas.bind("<B1-Motion>", self.pan_image)
        # self.map_canvas.bind("<ButtonRelease-1>", self.end_pan)
        # self.map_canvas.bind("<MouseWheel>", self.zoom)

        # Track the zoom level and pan offsets
        self.zoom_level = 1.0
        self.pan_x = 0
        self.pan_y = 0

        # Variables for selected stations
        self.start_point = None
        self.destination_point = None
        self.dropdown_var_start = StringVar(value="Select Station")
        self.dropdown_var_destination = StringVar(value="Select Station")

        # Initialize choice variable for route calculation
        self.choice_var = tk.StringVar(value="least_cost")  # Default choice

        #canvas
        # Canvas frame with scrollbars
        self.canvas_frame = Frame(root)
        self.canvas_frame.pack(fill="both", expand=True, padx=10, pady=10)

        # Scrollable Canvas
        self.map_canvas = Canvas(self.canvas_frame, bg="#f0f0f0", highlightthickness=1, highlightbackground="#cccccc")
        self.map_canvas.pack(side="left", fill="both", expand=True)

        self.h_scrollbar = tk.Scrollbar(self.canvas_frame, orient="horizontal", command=self.map_canvas.xview)
        self.h_scrollbar.pack(side="bottom", fill="x")
        self.v_scrollbar = tk.Scrollbar(self.canvas_frame, orient="vertical", command=self.map_canvas.yview)
        self.v_scrollbar.pack(side="right", fill="y")

        self.map_canvas.config(xscrollcommand=self.h_scrollbar.set, yscrollcommand=self.v_scrollbar.set)

        # Load map image
        self.map_image = Image.open("./frontend/images/map.jpg")  # Replace with your map image path
        self.map_image_tk = ImageTk.PhotoImage(self.map_image)

        # Create scrollable region
        self.map_width, self.map_height = self.map_image.size
        self.map_canvas.create_image(0, 0, image=self.map_image_tk, anchor="nw")
        self.map_canvas.config(scrollregion=(0, 0, self.map_width, self.map_height))

        # Draw station nodes (example data)
        # self.stations = {
        #     "Station A": {"coords": (1310, 465), "line": "Light Green"},
        #     "Station B": {"coords": (1210, 635), "line": "Light Green"},
        #     "Station C": {"coords": (1210, 565), "line": "Dark Green"},
        #     "Station D": {"coords": (400, 300), "line": "Blue"},
        #     "n24": (1310, 465),
        #     "n23": (1210 ,565),
        #     "n22": (1210, 635),
        #     "n21": (1210, 705),
        #     "n20": (1210, 775),
        #     "n19": (1210, 845),
        #     "n18": (1210, 915),
        #     "n17": (1210, 985),
        # }

        color_match = {
            "BTS Light Green": "lightgreen",
            "BTS Dark Green": "darkgreen",
            "BTS Gold": "gold",
            "MRT Blue": "blue",
            "MRT Purple": "purple",
            "MRT Yellow": "yellow",
            "MRT Pink": "pink",
            "Airport Rail Link": "brown",
            "SRT Dark Red": "darkred",
            "SRT Light Red": "red",
        }
        self.stations = self.lookUpTable.get_canvas_info()
        self.station_items = {}
        for station_code, data in self.stations.items():
            x, y = data["coords"]
            item = self.map_canvas.create_oval(x-10, y-10, x+10, y+10, fill=color_match[self.lookUpTable.get_line_from_code(station_code)], outline="black", tags="station", )
            self.station_items[item] = (station_code, self.lookUpTable.get_name_from_code(station_code))
            print(station_code)

        # Bind scroll and click events
        self.map_canvas.bind("<MouseWheel>", self.scroll_with_mouse)
        self.map_canvas.bind("<Button-1>", self.on_station_click)

    def scroll_with_mouse(self, event):
        if event.state & 0x1:  # Shift key for horizontal scroll
            self.map_canvas.xview_scroll(-1 * int(event.delta / 120), "units")
        else:  # Default vertical scroll
            self.map_canvas.yview_scroll(-1 * int(event.delta / 120), "units")

    def on_station_click(self, event):
        # Adjust click position for scrolling
        canvas_x = self.map_canvas.canvasx(event.x)
        canvas_y = self.map_canvas.canvasy(event.y)
        clicked_item = self.map_canvas.find_closest(canvas_x, canvas_y)[0]

        station_code, station_name = self.station_items.get(clicked_item)
        if station_name:
            self.show_station_selection_dialog(station_code, station_name)

    def show_station_selection_dialog(self, station_code, station_name):
        dialog = tk.Toplevel(self.root)
        dialog.title("Select Station Role")
        dialog.geometry("300x150")
        dialog.configure(bg="#ffffff")

        label = tk.Label(dialog, text=f"Set {station_name} as:", font=("Arial", 12), bg="#ffffff")
        label.pack(pady=20)

        # Buttons for Start and Destination
        start_button = tk.Button(dialog, text="Start", command=lambda: self.set_station("Start", station_code, station_name, dialog),
                                  bg="#4CAF50", fg="white", font=("Arial", 10), width=10)
        start_button.pack(side="left", padx=20)

        destination_button = tk.Button(dialog, text="Destination", command=lambda: self.set_station("Destination", station_code, station_name, dialog),
                                        bg="#007ACC", fg="white", font=("Arial", 10), width=10)
        destination_button.pack(side="right", padx=20)

    def set_station(self, role, station_code, station_name, dialog):
        if role == "Start":
            self.dropdown_var_start.set(station_name)
            self.selected_line_var.set(self.lookUpTable.get_line_from_code(station_code))

            self.selected_start_label.config(text=f"Start: {self.selected_line_var.get()} - {self.dropdown_var_start.get()}")
        elif role == "Destination":
            self.dropdown_var_destination.set(station_name)
            self.selected_line_var.set(self.lookUpTable.get_line_from_code(station_code))

            self.selected_destination_label.config(text=f"Destination: {self.selected_line_var.get()} - {self.dropdown_var_destination.get()}")

        dialog.destroy()  # Close the dialog

    def confirm_route(self):
        start = self.start_label.cget("text").replace("Start Point: ", "")
        destination = self.destination_label.cget("text").replace("Destination: ", "")

        if start == "Not selected" or destination == "Not selected":
            messagebox.showwarning("Incomplete Selection", "Please select both a start and destination station.")
            return

        messagebox.showinfo("Route Confirmed", f"Route set from {start} to {destination}")


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
            "BTS": [],
            "MRT": [],
            "Airport Rail Link": self.lookUpTable.get_airport_stations().values(),
            "Red Line": []
        }

        
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

    def update_dropdown(self, line, stations, parent, point_type):
        # Define stations for each color
        color_to_stations = {
            "Light Green": self.lookUpTable.get_lightgreen_stations().values(),
            "Dark Green": self.lookUpTable.get_darkgreen_stations().values(),
            "Gold": self.lookUpTable.get_gold_stations().values(),
            "Blue": self.lookUpTable.get_blue_stations().values(),
            "Purple": self.lookUpTable.get_purple_stations().values(),
            "Yellow": self.lookUpTable.get_yellow_stations().values(),
            "Pink": self.lookUpTable.get_pink_stations().values(),
            "Dark Red": self.lookUpTable.get_darkred_stations().values(),
            "Light Red": self.lookUpTable.get_lightred_stations().values(),
        }

        # If a color dropdown is needed
        if line in ["BTS", "MRT", "Red Line"]:
            if hasattr(self, 'dropdown_color_select') and self.dropdown_color_select is not None:
                self.dropdown_color_select.destroy()
            
            if line == "BTS":
                options = ["Light Green", "Dark Green", "Gold"]
            elif line == "MRT":
                options = ["Blue", "Purple", "Yellow", "Pink"]
            elif line == "Red Line":
                options = ["Dark Red", "Light Red"]
            
            self.dropdown_color_var = tk.StringVar(value="Select Line Color")
            self.dropdown_color_select = OptionMenu(
                parent, 
                self.dropdown_color_var, 
                *options,
                command=lambda _: self.update_stations_based_on_color(color_to_stations, parent, point_type)
            )
            self.dropdown_color_select.pack(anchor="w", padx=20)
        else:
            if hasattr(self, 'dropdown_color_select') and self.dropdown_color_select is not None:
                self.dropdown_color_select.destroy()

        # Initially update the station dropdown
        self.update_station_dropdown(parent, point_type, stations)

    def update_stations_based_on_color(self, color_to_stations, parent, point_type):
        selected_color = self.dropdown_color_var.get()
        if selected_color in color_to_stations:
            stations = color_to_stations[selected_color]
            self.update_station_dropdown(parent, point_type, stations)

    def update_station_dropdown(self, parent, point_type, stations):
        if point_type == "start":
            if hasattr(self, 'dropdown_menu_start') and self.dropdown_menu_start is not None:
                self.dropdown_menu_start.destroy()
            if not stations:
                return
            self.dropdown_var_start.set("Select Station")
            self.dropdown_menu_start = OptionMenu(parent, self.dropdown_var_start, *stations)
            self.dropdown_menu_start.config(bg="#e0e0e0", font=("Arial", 10), width=20)
            self.dropdown_menu_start.pack(anchor="sw", padx=20)
            self.start_point = self.dropdown_var_start
            self.dropdown_var_start.trace("w", lambda *args: self.selected_start_label.config(
                text=f"Start Point: {self.selected_line_var.get()} - {self.dropdown_var_start.get()}"
            ))

        elif point_type == "destination":
            if hasattr(self, 'dropdown_menu_destination') and self.dropdown_menu_destination is not None:
                self.dropdown_menu_destination.destroy()
            if not stations:
                return
            self.dropdown_var_destination.set("Select Station")
            self.dropdown_menu_destination = OptionMenu(parent, self.dropdown_var_destination, *stations)
            self.dropdown_menu_destination.config(bg="#e0e0e0", font=("Arial", 10), width=20)
            self.dropdown_menu_destination.pack(anchor="sw", padx=20)
            self.destination_point = self.dropdown_var_destination
            self.dropdown_var_destination.trace("w", lambda *args: self.selected_destination_label.config(
                text=f"Destination: {self.selected_line_var.get()} - {self.dropdown_var_destination.get()}"
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
        ]

        for text, value in options:
            Radiobutton(choice_window, text=text, variable=self.choice_var, value=value,
                        font=("Arial", 10), bg="#ffffff", anchor="w").pack(fill="x", padx=20, pady=5)

        tk.Button(choice_window, text="Confirm", command=lambda: [self.show_cards_option(self.choice_var.get()), choice_window.destroy()],
                  bg="#007acc", fg="white", font=("Arial", 10, "bold")).pack(pady=15)

    def show_cards_option(self, option):
        choice_window = Toplevel(self.root)
        choice_window.title("Select Avaliable Cards Discount")
        choice_window.geometry("300x380")
        choice_window.configure(bg="#ffffff")
        choice_window.resizable(False, False)

        self.mrt_options = [
            ("No Card", "normal"),
            ("Student Card", "student"),
            ("Children/Elder Card", "childold"),
        ]
        self.bts_options = [
            ("No Card", "orange"),
            ("Green (student) Card", "green"),
            ("Purple (elder) Card", "purple"),
        ]
        mrt_var = tk.StringVar(value="normal")
        bts_var = tk.StringVar(value="orange")
        
        # mrt options   
        tk.Label(choice_window, text="MRT Card Options", font=("Arial", 12, "bold"),
                 bg="#ffffff", fg="#333333").pack(pady=10)
        for card, value in self.mrt_options:
            Radiobutton(choice_window, text=card, variable=mrt_var, value=value,
                        font=("Arial", 10), bg="#ffffff", anchor="w").pack(fill="x", padx=20, pady=5)

        # bts options   
        tk.Label(choice_window, text="BTS Card Options", font=("Arial", 12, "bold"),
                 bg="#ffffff", fg="#333333").pack(pady=10)
        for card, value in self.bts_options:
            Radiobutton(choice_window, text=card, variable=bts_var, value=value,
                        font=("Arial", 10), bg="#ffffff", anchor="w").pack(fill="x", padx=20, pady=5)


        tk.Button(choice_window, text="Confirm", command=lambda: [self.show_detailed_result(option, bts_var.get(), mrt_var.get()), choice_window.destroy()],
                  bg="#007acc", fg="white", font=("Arial", 10, "bold"), anchor='s').pack(pady=15)
        
    def show_detailed_result(self, option, bts_card, mrt_card):
        print(bts_card, mrt_card)
        result_window = Toplevel(self.root)
        result_window.title("Route Calculation Result")
        result_window.geometry("400x600")
        result_window.configure(bg="#ffffff")
        result_window.resizable(True, True)

        start_code = self.lookUpTable.get_code_from_name(self.dropdown_var_start.get())
        destination_code =self.lookUpTable.get_code_from_name(self.dropdown_var_destination.get())

        if option == "least_cost":
            result = self.prologTrainQuery.query_cheapest_path(start_code, destination_code, bts_card, mrt_card)
        elif option == "least_station_changes":
            result = self.prologTrainQuery.query_fastest_path(start_code, destination_code, bts_card, mrt_card)
        # elif option == "least_cost_and_changes":
            # result = self.prologTrainQuery.query_best_path(start_code, destination_code, bts_card, mrt_card)
        path, length, fare, interchange = result
        
        print(result)
        route_steps_real = [
            {"station": self.lookUpTable.get_name_from_code(station_code), 
             "line": self.lookUpTable.get_line_from_code(station_code), "change_line": self.lookUpTable.check_interchange(path, i)} for i, station_code in enumerate(path)
        ]

        # display card is some card is used
        if bts_card != "orange":
            for card, value in self.bts_options:
                if value == bts_card:
                    Label(result_window, text=f"BTS card used: {card}", font=("Arial", 12, "bold"),
                        bg="#ffffff", fg="#027000").pack(anchor="w", padx=20, pady=10)
                    
        if mrt_card != "normal":
            for card, value in self.mrt_options:
                if value == mrt_card:
                    Label(result_window, text=f"MRT card used: {card}", font=("Arial", 12, "bold"),
                        bg="#ffffff", fg="#5e2c00").pack(anchor="w", padx=20, pady=10)


        
        Label(result_window, text=f"Path ({self.choice_var.get().replace("_", " ").capitalize()}):",
                  font=("Arial", 10, "bold"), bg="#ffffff", fg="#444444").pack(anchor="w", padx=20, pady=2)
        for step in route_steps_real:
            if step["change_line"]:
                Label(result_window, text=f"Change to {step['line']} Line", font=("Arial", 10, "italic"),
                      bg="#ffffff", fg="#666666").pack(anchor="w", padx=40, pady=5)
            Label(result_window, text=f"{step['line']} Line: {step['station']} ",
                  font=("Arial", 10), bg="#ffffff", fg="#444444").pack(anchor="w", padx=20, pady=2)

        
        Label(result_window, text=f"Total Cost: {fare} Baht", font=("Arial", 12, "bold"),
              bg="#ffffff", fg="#007acc").pack(anchor="w", padx=20, pady=15)
        Label(result_window, text=f"Number of stations traversed: {length} stations", font=("Arial", 12, "bold"),
              bg="#ffffff", fg="#007acc").pack(anchor="w", padx=20, pady=10)
        
        tk.Button(result_window, text="Open in browser", 
                  command=lambda: [GmapsBrowser(self.lookUpTable).start(path)],
                  bg="#007acc", fg="white", font=("Arial", 10, "bold"), anchor='s').pack(pady=15)
        

if __name__ == "__main__":
    root = tk.Tk()
    app = TransitOptimizerApp(root)
    root.mainloop()
