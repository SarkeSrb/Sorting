page 50100 "MS Sortings"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "MS Sorting Table";
    Caption = 'Sortings';
    layout
    {
        area(Content)
        {
            repeater(repeater)
            {
                field(Int; Rec.IntegerField)
                {
                    ApplicationArea = All;
                }
                field(Dec; Rec.DecimalField)
                {
                    ApplicationArea = All;
                }
                field(Cod; Rec.CodeField)
                {
                    ApplicationArea = All;
                }
                field(Tex; Rec.TextField)
                {
                    ApplicationArea = All;
                }
                field(Date; Rec.DateField)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SortByPrimary)
            {
                ApplicationArea = All;
                Caption = 'Sort By Primary';
                trigger OnAction()
                begin
                    Rec.SetCurrentKey(IntegerField, DecimalField);
                end;
            }
            action(SortByCode)
            {
                ApplicationArea = All;
                Caption = 'Sort By Code';
                trigger OnAction()
                begin
                    Rec.SetCurrentKey(CodeField);
                end;
            }
            action(SortByDate)
            {
                ApplicationArea = All;
                Caption = 'Sort By Date';
                trigger OnAction()
                begin
                    Rec.SetCurrentKey(DateField);
                end;
            }
            action(SortByDateText)
            {
                ApplicationArea = All;
                Caption = 'Sort By Date and Text';
                trigger OnAction()
                begin
                    Rec.SetCurrentKey(DateField, TextField);
                end;
            }
            action(SetCustomView)
            {
                ApplicationArea = All;
                Caption = 'Set Custom View';
                trigger OnAction()
                var
                    FieldTable: Record Field;
                    FilterTable: Record "MS Filter Table";
                    FilterFields: Page "MS Filter Fields";
                    SelectSorting: Page "MS Sorting Fields";
                    AscendingDescending: Option "Ascending","Descending";
                    FilterString: Text;
                    SetViewText: Text;
                    SortingFields: Text;
                    AscendingDescendingLbl: Label 'Ascending,Descending';
                    FilterLbl: Label '%1=%2(%3)', Locked = true;
                    OrderLbl: Label ' Order(%1)', Locked = true;
                    SortingLbl: Label 'Sorting(%1)', Locked = true;
                    WhereLbl: Label ' Where(%1)', Locked = true;
                begin
                    SelectSorting.LookupMode(true);
                    if SelectSorting.RunModal() <> Action::LookupOK then
                        exit;

                    SelectSorting.SetSelectionFilter(FieldTable);
                    FieldTable.FindSet();
                    repeat
                        if SortingFields <> '' then
                            SortingFields += ',' + FieldTable.FieldName
                        else
                            SortingFields += FieldTable.FieldName;
                    until FieldTable.Next() = 0;

                    SortingFields := StrSubstNo(SortingLbl, SortingFields);
                    AscendingDescending := StrMenu(AscendingDescendingLbl, 1, 'Select Order') - 1;

                    if FilterFields.RunModal() <> Action::OK then
                        exit;

                    if not FilterTable.IsEmpty() then begin
                        FilterTable.FindSet();
                        repeat
                            if FilterString <> '' then
                                FilterString += ',' + StrSubstNo(FilterLbl, FilterTable.Field, FilterTable.FilterConst, FilterTable.FilterValue)
                            else
                                FilterString += StrSubstNo(FilterLbl, FilterTable.Field, FilterTable.FilterConst, FilterTable.FilterValue);
                        until FilterTable.Next() = 0;

                        FilterTable.DeleteAll();
                    end;

                    if FilterString <> '' then begin
                        FilterString := StrSubstNo(WhereLbl, FilterString);
                        SetViewText := SortingFields + StrSubstNo(OrderLbl, Format(AscendingDescending)) + FilterString;
                    end else
                        SetViewText := SortingFields + StrSubstNo(OrderLbl, Format(AscendingDescending));

                    Message(SetViewText);

                    Rec.SetView(SetViewText);
                end;
            }
        }
    }
}