table 50101 "MS Filter Table"
{
    DataClassification = CustomerContent;
    Caption = 'Filter Table';
    fields
    {
        field(1; Field; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(2; FilterConst; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "filter","const";
        }
        field(3; FilterValue; Text[50])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; Field)
        {
            Clustered = true;
        }
    }
}