import os, sys, yaml

if os.environ.get('DEVELOPMENT_ENVIRONMENT') != 'production':
    file = open('habsci/config/settings.yml')
    dataMap = yaml.load(file)
    file.close()
    for key, value in dataMap.items():
      os.environ[key] = value