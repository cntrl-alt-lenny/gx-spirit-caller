typedef struct { unsigned int ids[17]; } Table;
typedef struct { int unused; unsigned int mode; unsigned char pad[0x18]; unsigned char choices[1]; } Menu;
extern const Table data_ov017_021b7ef8;
extern char data_ov017_021b867c[256];
typedef struct { unsigned int unused; unsigned int language:3; unsigned int rest:29; } Settings;
extern Settings data_02104f4c;
extern int func_0202b100(int a0);
extern char *func_0202c0c0(int id);
extern char *func_020aadf8(char *dest, const char *src);
char *func_ov017_021b6264(Menu *p, int index) {
    switch (p->mode) {
    case 0: return func_0202c0c0(p->choices[index] + 0x7bc);
    case 1: return func_0202c0c0(p->choices[index] + 0x7d0);
    case 2: {
        char buffer[256];
        Table table = data_ov017_021b7ef8;
        int n;
        char *s;
        if (p->choices[index] == 0) return func_0202c0c0(0x79f);
        n = 0;
        func_020aadf8(buffer, (const char *)func_0202b100(table.ids[p->choices[index]]));
        if (data_02104f4c.language == 2 && table.ids[p->choices[index]] == 0x190d) {
            if (buffer[0] != 0) {
                s = buffer;
                do {
                    if (*s != ' ') data_ov017_021b867c[n++] = *s;
                } while (*++s != 0);
            }
            data_ov017_021b867c[n] = 0;
        } else {
            func_020aadf8(data_ov017_021b867c, buffer);
        }
        return data_ov017_021b867c;
    }
    case 3: return func_0202c0c0(p->choices[index] + 0x76c);
    }
    return 0;
}



