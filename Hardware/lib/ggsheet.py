# Import Library
import urequests as requests
import ujson
import os

__version__ = '0.0.3'
__author__ = 'Teeraphat Kullanankanjana'

class MicroGoogleSheet():
    def __init__(self, googleSheetURL, sheet_name="Sheet1", deploymentID=""):
        self.sheetID = self.get_googleSheetID(googleSheetURL)
        self.sheetName = str(sheet_name)
        self.deploymentID = str(deploymentID)

    def get_googleSheetID(self, url):
        start_index = url.find('/d/') + 3
        end_index = url.find('/edit')
        sheet_id = url[start_index:end_index]
        return sheet_id

    def encoding_url(self, data):
        encoded_text = ujson.dumps(data)[1:-1]
        encoded_text = ujson.loads('"' + encoded_text + '"')
        encoded_text = encoded_text.replace('\\u', '%u')
        encoded_text = encoded_text.replace('"', '')
        encoded_text = encoded_text.replace('+', ' ')
        encoded_text = encoded_text.encode('utf-8')
        encoded_text = ''.join(['%' + ('%02X' % b) for b in encoded_text])
        return encoded_text

    def set_DeploymentID(self, deployment_id):
        self.deploymentID = str(deployment_id)

    def set_SheetName(self, sheetName):
        self.sheetName = str(sheetName)

    def updateCell(self, row=1, column=1, data=""):
        sheet_name = self.encoding_url(self.sheetName)
        mode = "updateCell"
        url = "https://script.google.com/macros/s/{}/exec?sheet_id={}&sheet_name={}&mode={}&row={}&column={}&data={}".format(
            self.deploymentID, self.sheetID, sheet_name, mode, row, column, self.encoding_url(
                str(data))
        )
        response = requests.get(url)
        response.close()
        return response.status_code

    def updateRow(self, row=1, data=[]):
        sheet_name = self.encoding_url(self.sheetName)
        mode = "updateRow"
        url = "https://script.google.com/macros/s/{}/exec?sheet_id={}&sheet_name={}&mode={}&row={}".format(
            self.deploymentID, self.sheetID, sheet_name, mode, row)
        for i in range(len(data)):
            url += "&data{}={}".format(i, self.encoding_url(str(data[i])))
        response = requests.get(url)
        response.close()
        return response.status_code

    def appendRow(self, row=0, data=[]):
        sheet_name = self.encoding_url(self.sheetName)
        mode = "appendRow"
        url = "https://script.google.com/macros/s/{}/exec?sheet_id={}&sheet_name={}&mode={}&row={}".format(
            self.deploymentID, self.sheetID, sheet_name, mode, row)
        for i in range(len(data)):
            url += "&data{}={}".format(i, self.encoding