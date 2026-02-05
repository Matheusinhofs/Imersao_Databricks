CREATE OR REFRESH STREAMING LIVE TABLE bitcoin
TBLPROPERTIES ("quality" = "bronze")
AS 
-- Aqui lemos o arquivo JSON da pasta raw
SELECT *
FROM cloud_files (
  '/Volumes/lakehouse/raw/coinbase/bitcoin_spot/',
  'json',
  map(
    'cloudFiles.includeExistingFiles', 'false',
    'cloudFiles.inferColumnTypes', 'true',
    'cloudFiles.schemaEvolutionMode','addNewColumns'
    )
  );
