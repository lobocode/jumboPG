{-# LANGUAGE OverloadedStrings #-}

module ConfigGenerator (generateConfig) where

import Data.Text (Text, pack, intercalate)


generateConfig :: Text -- DB Version
               -> Text -- OS type
               -> Text -- DB Type
               -> Int  -- Total Memory Ram
               -> Int  -- Number of CPUs
               -> Int  -- Number of connections
               -> Text -- Data Storage
               -> Text -- conteúdo do postgresql.conf
generateConfig dbVersion osType dbType totalMemoryRam numberOfCPUs numberOfConnections dataStorage =
    intercalate "\n"
    [ "# PostgreSQL configuration file"
    , ""
    , "# DB Version"
    , "db_version = " <> dbVersion
    , ""
    , "# OS type"
    , "os_type = " <> osType
    , ""
    , "# DB Type"
    , "db_type = " <> dbType
    , ""
    , "# Total Memory Ram"
    , "total_memory_ram = " <> (pack $ show totalMemoryRam)
    , ""
    , "# Number of CPUs"
    , "number_of_cpus = " <> (pack $ show numberOfCPUs)
    , ""
    , "# Number of connections"
    , "number_of_connections = " <> (pack $ show numberOfConnections)
    , ""
    , "# Data Storage"
    , "data_storage = " <> dataStorage
    ]
