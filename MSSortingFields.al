page 50101 "MS Sorting Fields"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Field;
    SourceTableView = where(TableNo = const(Database::"MS Sorting Table"));

    Caption = 'Select Sorting Fields';
    layout
    {
        area(Content)
        {
            repeater(repeater)
            {
                field(Name; Rec.FieldName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}