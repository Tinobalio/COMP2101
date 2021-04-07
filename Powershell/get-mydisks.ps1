function get-mydisks {
get-disk | ft Manufacturer, Model, SerialNumber, FirmwareRevision, Size
}