import webbrowser
import threading
from flask import Flask, render_template_string

class GmapsBrowser:
    def __init__(self, lut):
        self.lookUpTable = lut

    def start(self, path_in_codes: list[str]):
        app = Flask(__name__)

        # Your Google Maps API Key
        GOOGLE_MAPS_API_KEY = "AIzaSyDbyD2aACrvpGX9KY-DQ5Soyf2bM0hVwNw"

        # HTML Template
        HTML_TEMPLATE = """
        <!DOCTYPE html>
        <html>
        <head>
            <title>Transit Route Map</title>
            <script src="https://maps.googleapis.com/maps/api/js?key={{ api_key }}&callback=initMap" async defer></script>
            <style>
                #map {
                    height: 100%;
                    width: 100%;
                }
                html, body {
                    height: 100%;
                    margin: 0;
                    padding: 0;
                }
            </style>
        </head>
        <body>
            <div id="map"></div>
            <script>
                function initMap() {
                    const map = new google.maps.Map(document.getElementById("map"), {
                        center: { lat: 13.7563, lng: 100.5018 }, // Central Bangkok
                        zoom: 12,
                    });

                    const directionsService = new google.maps.DirectionsService();
                    const subRoutes = JSON.parse('{{ sub_routes|tojson }}');

                    // Sequential markers array
                    const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    let markerIndex = 0; // Global counter for marker sequence

                    // Plot each sub-route with markers
                    subRoutes.forEach((route, routeIndex) => {
                        const directionsRenderer = new google.maps.DirectionsRenderer({
                            map: map,
                            suppressMarkers: true, // Suppress default markers
                        });

                        const request = {
                            origin: route[0],
                            destination: route[route.length - 1],
                            travelMode: "TRANSIT",
                            transitOptions: {
                                modes: ["RAIL"],
                            },
                        };

                        directionsService.route(request, (result, status) => {
                            if (status === "OK") {
                                directionsRenderer.setDirections(result);

                                // Add sequential markers for each station
                                const leg = result.routes[0].legs[0];

                                // Add marker for origin
                                new google.maps.Marker({
                                    position: leg.start_location,
                                    label: alphabet[markerIndex % 26],
                                    map: map,
                                });
                                markerIndex++; // Increment global marker index

                                // Add marker for destination
                                new google.maps.Marker({
                                    position: leg.end_location,
                                    label: alphabet[markerIndex % 26],
                                    map: map,
                                });
                                markerIndex++; // Increment global marker index
                            } else {
                                console.error("Error fetching route:", status);
                            }
                        });
                    });
                }
            </script>
        </body>
        </html>
        """

        @app.route("/")
        def show_route():
            # Helper function to format station names with line names
            def format_station_with_line(code):
                station_name = self.lookUpTable.get_name_from_code(code)
                line_name = self.lookUpTable.get_line_from_code(code)
                return f"{line_name} Line - {station_name}"

            origin = format_station_with_line(path_in_codes[0])
            destination = format_station_with_line(path_in_codes[-1])

            # Generate sub-routes with formatted station names
            sub_routes = []
            current_sub_route = [origin]
            previous_line = self.lookUpTable.get_line_from_code(path_in_codes[0])

            for code in path_in_codes[1:]:
                current_line = self.lookUpTable.get_line_from_code(code)
                station = format_station_with_line(code)

                if current_line != previous_line:
                    # End current sub-route and start a new one
                    current_sub_route.append(station)
                    sub_routes.append(current_sub_route)
                    current_sub_route = [station]  # Start a new sub-route
                    previous_line = current_line
                else:
                    current_sub_route.append(station)

            # Add the last sub-route
            if len(current_sub_route) > 1:
                sub_routes.append(current_sub_route)

            print(f"Sub-routes: {sub_routes}")

            # Render the HTML with the sub-routes
            return render_template_string(
                HTML_TEMPLATE,
                api_key=GOOGLE_MAPS_API_KEY,
                sub_routes=sub_routes,
            )

        # Run Flask in a separate thread
        def run_flask():
            app.run(debug=False, use_reloader=False)

        # Start the Flask server in a background thread
        threading.Thread(target=run_flask).start()

        # Open the web browser automatically
        webbrowser.open("http://127.0.0.1:5000/")
