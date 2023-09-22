import pandas as pd
from io import StringIO
from IPython.display import display

def display_csv(csv_string):
    try:
        csv_buffer = StringIO(csv_string)
        df = pd.read_csv(csv_buffer)

        # Simply displaying the DataFrame will render it as a table
        display(df)
    except pd.errors.EmptyDataError:
        print("The CSV data is empty.")
    except pd.errors.ParserError:
        print("Could not parse the string as a CSV.")