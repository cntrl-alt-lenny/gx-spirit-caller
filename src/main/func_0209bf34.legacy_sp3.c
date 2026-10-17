extern int data_021026a4[13];

typedef struct {
    unsigned int year;
    unsigned int month;
    unsigned int day;
    int wday;
} Date;

unsigned int func_0209bf34(Date *d) {
    unsigned int days;
    if (d->year >= 100 || d->month < 1 || d->month > 12 || d->day < 1 || d->day > 31 || d->wday >= 7 || d->month < 1 || d->month > 12) {
        return -1;
    }
    days = d->day - 1 + data_021026a4[d->month];
    if (d->month >= 3 && (d->year & 3) == 0) {
        days++;
    }
    return d->year * 365 + days + ((d->year + 3) >> 2);
}
