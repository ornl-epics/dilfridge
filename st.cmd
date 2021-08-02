#!../../bin/linux-x86_64/dilFridge

## You may have to change dilFridge to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/dilFridge.dbd"
dilFridge_registerRecordDeviceDriver pdbbase

# Define protocol path
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(DILFRIDGE)/protocol")


#Dilfridge
asynSetAutoConnectTimeout(5.0)
drvAsynIPPortConfigure( "Dilfridge1", "10.112.132.11:33576 tcp", 0, 0, 0 )



#enables debugging 0xff is the max setting
asynSetTraceIOMask("Dilfridge1", 0,0x07)
asynSetTraceMask("Dilfridge1", 0,0x07)



## Load record instances
#dbLoadRecords("db/xxx.db","user=zmaHost")
dbLoadRecords("db/dilfridge.db")



cd ${TOP}/iocBoot/${IOC}
iocInit

#enables debugging 0xff is the max setting
asynSetTraceIOMask("Dilfridge1", 0,0x07)
asynSetTraceMask("Dilfridge1", 0,0x07)



## Start any sequence programs
#seq sncxxx,"user=zmaHost"
