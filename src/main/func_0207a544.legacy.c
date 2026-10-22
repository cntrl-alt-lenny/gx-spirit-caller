typedef struct { unsigned short pad0, state, pad4, pad6, kind, value, padc, result; } Event;
extern void *data_021a088c;
extern void func_0207a334(Event *self);
extern void func_0207af28(void);
extern void func_0207b038(int a0);
extern int func_0207b13c(int a, int b, int c, int d);
extern int func_0209f7fc(void (*callback)(Event *), void *buffer, unsigned int size);

void func_0207a544(Event *self) {
    switch (self->state) {
    case 0:
        switch ((int)self->kind) {
        case 8:
        case 9:
            switch (*(int *)((char *)data_021a088c + 0x2260)) {
            case 10:
                *(unsigned short *)((char *)data_021a088c + 0x2282) = 0;
            case 8:
                func_0207b038(12);
                return;
            case 9:
                *(unsigned short *)((char *)data_021a088c + 0x2282) = 0;
                *(unsigned short *)((char *)data_021a088c + 0x2280) = 6;
            case 12:
                func_0207af28();
                return;
            default:
                break;
            }
            break;
        case 7:
            if (*(int *)((char *)data_021a088c + 0x2260) == 12) {
                func_0207b038(8);
                func_0207af28();
                return;
            }
            if (self->value >= 1 && self->value <= 0x7d7) {
                *(unsigned short *)((char *)data_021a088c + 0x2282) = self->value;
                switch (func_0209f7fc(func_0207a334, (char *)data_021a088c + 0x1500, 0x620)) {
                case 2:
                    return;
                case 8:
                    func_0207b038(12);
                    func_0207b13c(1, (int)((char *)data_021a088c + 0x2140), 0, 0x7ed);
                    return;
                case 3:
                default:
                    func_0207b038(11);
                    func_0207b13c(7, (int)((char *)data_021a088c + 0x2140), 0, 0x7f6);
                    return;
                }
            }
            func_0207af28();
            return;
        case 6:
        case 26:
            break;
        case 0:
        default:
            func_0207b038(11);
            func_0207b13c(7, (int)((char *)data_021a088c + 0x2140), self->kind, 0x804);
            return;
        }
        break;
    case 1:
        *(unsigned short *)((char *)data_021a088c + 0x22f8) = self->result;
    case 6:
    case 11:
    case 12:
        func_0207b038(8);
        func_0207af28();
        return;
    case 2: case 3: case 4: case 5: case 7: case 8: case 9: case 10:
    default:
        func_0207b038(11);
        func_0207b13c(7, (int)((char *)data_021a088c + 0x2140), 0, 0x81b);
        break;
    }
}



