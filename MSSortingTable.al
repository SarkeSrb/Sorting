table 50100 "MS Sorting Table"
{
    DataClassification = CustomerContent;
    Caption = 'MS Sorting Table';
    fields
    {
        field(1; IntegerField; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Integer';
        }
        field(2; DecimalField; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Decimal';
        }
        field(3; CodeField; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(4; TextField; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Text';
        }
        field(5; DateField; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }
    }

    keys
    {
        key(PK; IntegerField, DecimalField)
        {
            Clustered = true;
        }
        key(SK; CodeField)
        {

        }
    }
}