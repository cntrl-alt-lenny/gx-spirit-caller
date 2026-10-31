typedef struct { int year, month, day, weekday; } Date;
typedef struct { int busy; void (*callback)(int, int); Date *out; Date *out2; int arg; unsigned command; int pending; void (*alarm)(void); } State;
extern State data_021a8438;
extern int func_0209b55c(unsigned int bcd);
extern int func_0209bdc8(Date *date);
/* The thunk has four formal arguments but this caller supplies none. */
extern int func_0209bd98();
typedef struct { unsigned year:8; unsigned month:5; unsigned pad:3; unsigned day:6; unsigned rest:10; } DateBits;
typedef struct { unsigned second:6; unsigned pad0:2; unsigned minute:7; unsigned pad1:1; unsigned hour:7; unsigned rest:9; } TimeBits;
typedef struct { unsigned mode:3; unsigned pad0:4; unsigned flag0:1; unsigned minute:6; unsigned pad1:1; unsigned flag1:1; unsigned hour:7; unsigned flag2:1; unsigned rest:8; } AlarmBits;
typedef struct { unsigned short mode:4; unsigned short pad:2; unsigned short flag:1; unsigned short rest:9; } StatusBits;
void func_0209b5e0(int unused, unsigned int message, int error) {
    void (*callback)(int, int);
    Date *out;
    int result;
    unsigned int type;
    unsigned int status;
    if (error != 0) {
        if (data_021a8438.pending != 0) data_021a8438.pending = 0;
        if (data_021a8438.busy != 0) data_021a8438.busy = 0;
        callback = data_021a8438.callback;
        if (callback != 0) {
            data_021a8438.callback = 0;
            callback(6, data_021a8438.arg);
        }
        return;
    }
    type = (unsigned char)((message & 0x7f00) >> 8);
    status = message & 0xff;
    if (type == 0x30) {
        if (data_021a8438.alarm != 0) data_021a8438.alarm();
        return;
    }
    if (status == 0) {
        result = 0;
        switch (data_021a8438.command) {
        case 0:
            out = data_021a8438.out;
            out->year = func_0209b55c(*(unsigned char *)0x027ffde8);
            out->month = func_0209b55c(((DateBits *)0x027ffde8)->month);
            out->day = func_0209b55c(((DateBits *)0x027ffde8)->day);
            out->weekday = func_0209bdc8(out);
            break;
        case 1:
            out = data_021a8438.out;
            out->year = func_0209b55c(((TimeBits *)0x027ffdec)->second);
            out->month = func_0209b55c(((TimeBits *)0x027ffdec)->minute);
            out->day = func_0209b55c(((TimeBits *)0x027ffdec)->hour);
            break;
        case 2:
            out = data_021a8438.out;
            out->year = func_0209b55c(*(unsigned int *)0x027ffde8 & 0xff);
            out->month = func_0209b55c(((DateBits *)0x027ffde8)->month);
            out->day = func_0209b55c(((DateBits *)0x027ffde8)->day);
            out->weekday = func_0209bdc8(out);
            out = data_021a8438.out2;
            out->year = func_0209b55c(((TimeBits *)0x027ffdec)->second);
            out->month = func_0209b55c(((TimeBits *)0x027ffdec)->minute);
            out->day = func_0209b55c(((TimeBits *)0x027ffdec)->hour);
            break;
        case 6:
            out = data_021a8438.out;
            switch (((StatusBits *)0x027ffdea)->mode) {
            case 4: out->year = 1; break;
            default: out->year = 0; break;
            }
            break;
        case 7:
            out = data_021a8438.out;
            if (((StatusBits *)0x027ffdea)->flag) out->year = 1;
            else out->year = 0;
            break;
        case 8:
            out = data_021a8438.out;
            out->year = ((AlarmBits *)0x027ffdec)->mode;
            out->month = func_0209b55c(((AlarmBits *)0x027ffdec)->minute);
            out->day = func_0209b55c(((AlarmBits *)0x027ffdec)->hour);
            out->weekday = 0;
            if (((AlarmBits *)0x027ffdec)->flag0) out->weekday += 1;
            if (((AlarmBits *)0x027ffdec)->flag1) out->weekday += 2;
            if (((AlarmBits *)0x027ffdec)->flag2) out->weekday += 4;
            break;
        case 9:
            if (data_021a8438.pending == 0) {
                if (data_021a8438.out->year == 1) {
                    if (((StatusBits *)0x027ffdea)->mode != 4) {
                        data_021a8438.pending++;
                        ((StatusBits *)0x027ffdea)->mode = 4;
                        if (func_0209bd98() == 0) { data_021a8438.pending = 0; result = 3; }
                    }
                } else {
                    if (((StatusBits *)0x027ffdea)->mode != 0) {
                        data_021a8438.pending++;
                        ((StatusBits *)0x027ffdea)->mode = 0;
                        if (func_0209bd98() == 0) { data_021a8438.pending = 0; result = 3; }
                    }
                }
            } else data_021a8438.pending = 0;
            break;
        case 10:
            if (data_021a8438.pending == 0) {
                if (data_021a8438.out->year == 1) {
                    if (((StatusBits *)0x027ffdea)->flag == 0) {
                        data_021a8438.pending++;
                        ((StatusBits *)0x027ffdea)->flag = 1;
                        if (func_0209bd98() == 0) { data_021a8438.pending = 0; result = 3; }
                    }
                } else {
                    if (((StatusBits *)0x027ffdea)->flag != 0) {
                        data_021a8438.pending++;
                        ((StatusBits *)0x027ffdea)->flag = 0;
                        if (func_0209bd98() == 0) { data_021a8438.pending = 0; result = 3; }
                    }
                }
            } else data_021a8438.pending = 0;
            break;
        case 3: case 4: case 5: case 11: case 12: case 13: case 14: case 15: break;
        default: data_021a8438.pending = 0; result = 4; break;
        }
    } else {
        data_021a8438.pending = 0;
        switch (status) {
        case 1: result = 4; break;
        case 2: result = 5; break;
        case 3: result = 1; break;
        case 0: case 4: default: result = 6; break;
        }
    }
    if (data_021a8438.pending == 0) {
        if (data_021a8438.busy != 0) data_021a8438.busy = 0;
        callback = data_021a8438.callback;
        if (callback != 0) {
            data_021a8438.callback = 0;
            callback(result, data_021a8438.arg);
        }
    }
}
