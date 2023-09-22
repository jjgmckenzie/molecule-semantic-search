import json

def display_json(json_string):
    try:
        # Parse the JSON string
        parsed_json = json.loads(json_string)

        # Pretty-print the JSON data with indentation
        formatted_json_string = json.dumps(parsed_json, indent=4)

        print(formatted_json_string)

    except json.JSONDecodeError:
        print("Could not parse the string as JSON.")