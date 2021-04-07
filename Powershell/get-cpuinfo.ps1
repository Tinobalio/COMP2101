function get-cpuinfo {
get-ciminstance cim_processor | Format-List "Manufacturer","Name","MaxClockSpeed","NumberofCores"
}