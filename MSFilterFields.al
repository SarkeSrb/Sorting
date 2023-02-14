page 50102 "MS Filter Fields"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "MS Filter Table";

    Caption = 'Select Filter Fields';
    layout
    {
        area(Content)
        {
            repeater(repeater)
            {
                field(Name; Rec.Field)
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    Lookup = true;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FieldTable: Record Field;
                        FieldsPage: Page "Fields Lookup";
                    begin
                        FieldTable.FilterGroup(2);
                        FieldTable.SetFilter(TableNo, '%1', Database::"Sorting Table");
                        FieldTable.FilterGroup(0);
                        FieldsPage.SetTableView(FieldTable);
                        FieldsPage.RunModal();
                        FieldsPage.GetRecord(FieldTable);
                        Rec.Field := FieldTable.FieldName;
                    end;
                }
                field(FilterConst; Rec.FilterConst)
                {
                    ApplicationArea = All;
                    Caption = 'Filter Const';
                }
                field(FilterValue; Rec.FilterValue)
                {
                    ApplicationArea = All;
                    Caption = 'Filter Value';
                }
            }
        }
    }
}