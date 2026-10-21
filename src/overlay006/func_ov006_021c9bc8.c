typedef struct { int found, column, row; } Hit;
void func_ov006_021c9bc8(int *base, int x, int y, Hit *out) {
    int column, row, top, left, columns, rows;
    rows = base[31];
    row = 0;
    if (rows > 0) {
        top = base[35];
        do {
            if (y >= top && y <= top + 19) {
                columns = base[30];
                column = 0;
                if (columns > 0) {
                    left = base[34];
                    do {
                        if (x >= left && x <= left + 19) {
                            out->found = 1;
                            out->column = column;
                            out->row = row;
                            return;
                        }
                        column++;
                        left += 20;
                    } while (column < columns);
                }
            }
            row++;
            top += 20;
        } while (row < rows);
    }
    out->found = 0;
}
