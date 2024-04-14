# Wifi Configuration
from wifi_manager import WifiManager
wm = WifiManager()
wm.connect()

# Google Sheet Configuration 
from ggsheet import MicroGoogleSheet
# Google Sheet Credential 
google_sheet_url = "https://docs.google.com/spreadsheets/d/1lSWDAn3s9cMCgq8WEEKGNvahQ5Kq02dPz0kzT_3ygDw/edit#gid=0"
google_sheet_name = "Sheet1"
google_app_deployment_id = "AKfycbwNDlaFD6xwoAQZjKmizRYWP3HUNwRbWWn903gyGT0KebcrN0yS6J87-uKoMFIn2Ga3"

# Create Instance 
ggsheet = MicroGoogleSheet(google_sheet_url,google_sheet_name)
ggsheet.set_DeploymentID(google_app_deployment_id)

# create the Google App Script file (not necessary if it already exists).
ggsheet.gen_scriptFile()

# Update the data to a specific cell (Row,Column,Data)
ggsheet.updateCell(1,1,"Hello this is my first data")

# Get the data from a specific cell (Row,Column)
print(ggsheet.getCell(1,1))

# Delete the data from a specific cell (Row,Column)
ggsheet.deleteCell(1,1)

# Append the data to a specific row (Row, Data List)
ggsheet.appendRow(1,[1,2,3,"Row 1 Appended!"])

# Update the data in a specific row (Row, Data List) 
ggsheet.updateRow(1,[3,2,1,"Row 1 Updated!"])

# Get all of the data from a specific row (Row)
print(ggsheet.getRow(1))

# Delete the data in a specific row (Row)
ggsheet.deleteRow(1)

# Append the data to a specific column (Column, Data List)
ggsheet.appendColumn(1,[1,2,3,"Column 1 Appended!"])

# Update the data to a specific column (Column, Data List)
ggsheet.updateColumn(1,[3,2,1,"Column 1 Updated!"])

# Get all of the data from a specific column (Column)
print(ggsheet.getColumn(1))

# Delete the data in a specific column (Column)
ggsheet.deleteColumn(1) 
