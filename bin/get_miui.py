import os
import yaml
import requests
import sys

class XiaomiRomQuery:
    def __init__(self):
        # fw_yaml_url = "https://xiaomifirmwareupdater.com/data/devices/latest.yml"
        rom_yaml_url = "https://cdn.jsdelivr.net/gh/XiaomiFirmwareUpdater/miui-updates-tracker@master/data/latest.yml"
        self.yaml_data = yaml.load(requests.get(rom_yaml_url).text,Loader=yaml.FullLoader)
        self.branch_map={"Stable":"Stable","Beta":'Weekly',"PublicBeta":'Public Beta'}
        self.method={"recovery":"Recovery","fastboot":"Fastboot",}
        self.codename={}
        for i in self.yaml_data:
            self.codename[i["codename"]] =""
        self.codename = sorted(list(self.codename.keys()))
        

    def query_rom(self,model_name,region,rom_cleases,rom_version):
        codename=self.query_codename(model_name,region)
        for item in self.yaml_data:
            if item["codename"] == codename and item["branch"]==self.branch_map[rom_version] and item["method"]==self.method[rom_cleases]:
                return item["link"]

    def query_codename(self,model_name,region):
        for i in self.codename:
            codename = model_name+"_"+region+"_global"
            if i == model_name and region=="cn":
               return model_name
            elif i == codename:
               return codename

        raise RuntimeError("Could not find {}".format(codename))

if __name__ == '__main__':
    try:
        REGION = str(sys.argv[1])
        MODEL_NAME = str(sys.argv[2])
        ROM_CLEASES = str(sys.argv[3])
        ROM_VERSION = str(sys.argv[4])
    except IndexError:
        print('\nUsage: XiaomiFirmwareUpdate.py <Region> <Device_Code> <Rom_cleases> <Rom_version>\n')
        print('    <Region>: Miui Rom Region, eg. CN\n')
        print('    <Device_Code>: Device Code, eg. venus\n')
        print('    <Rom_cleases>: Miui Rom Type, eg. recovery\n')
        print('    <Rom_version>: Miui Rom Version, eg. beta\n')
        try:
            input = raw_input
        except NameError: pass
        input('Press ENTER to exit...')
        sys.exit()

    xiaomiRomQuery = XiaomiRomQuery()
    # step 2: get rom link by query_rom()
    print(xiaomiRomQuery.query_rom(MODEL_NAME,REGION,ROM_CLEASES,ROM_VERSION))