typedef struct {
    int year;
    int month;
    int day;
} Date;

int func_0209bdc8(Date *date) {
    int y = date->year + 2000;
    int m = date->month - 2;
    int day = date->day;
    int c;
    int yy;
    int w;
    if (m < 1) {
        y--;
        m += 12;
    }
    c = y / 100;
    yy = y % 100;
    w = day + (26 * m - 2) / 10 + yy + yy / 4 + c / 4 + c * 5;
    return w % 7;
}