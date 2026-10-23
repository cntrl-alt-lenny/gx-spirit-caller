typedef struct {
    int f0, f4, f8, fc, f10, pad14, pad18, pad1c;
    unsigned flag : 1;
    unsigned flag2 : 1;
    unsigned : 30;
} Ov006Slot;
extern char data_ov006_0224f448[];
extern int func_ov006_021bd6bc(char *obj, int sel);
extern unsigned short func_ov006_021b6d1c(char *p, int sel, int idx, int flag);
extern int func_0202de9c(int unused0);
extern int func_ov006_021b7010(char *base, int kind, int target, int *out);
extern int func_ov006_021b6dac(char *base, int sel, int idx, int flag);
extern int func_ov006_021b75f0(char *base, int from, int to, int target, int count);
int func_ov006_021be0b0(char *self, int from, int to) {
    char *base = data_ov006_0224f448;
    Ov006Slot *slot = (Ov006Slot *)(self + 0xa0) + *(int *)(self + 0x50);
    int changed = 0;
    int idx, target, type, mode, limit;
    int a, b, count, end, near;
    idx = func_ov006_021bd6bc(self, *(int *)(self + 0x50));
    if (idx < 0) return changed;
    target = func_ov006_021b6d1c(base, *(int *)(self + 0x50), idx, slot->flag);
    type = func_0202de9c(target);
    if (from == to) return changed;
    mode = *(int *)(self + 0x40);
    if (mode != 2) {
        switch (from) {
        case 1: case 2: if (type == 3) return 0; break;
        case 3: if (type != 3) return changed; break;
        }
    }
    if (mode == 1) {
        switch (from) {case 1: limit = 0x80; break; case 2: limit = 0x80; break; case 3: limit = 0x80; break;}
    } else if (mode == 2) {
        switch (from) {case 1: limit = 10; break;}
    } else {
        switch (from) {case 1: limit = 80; break; case 2: limit = 15; break; case 3: limit = 30; break;}
    }
    if (from != 0 && *(unsigned short *)(base + from * 2 + 0x816a) >= limit) {
        switch (from) {
        case 1:
            *(int *)(self + 0x88) = 6;
            *(int *)(self + 0x8c) = *(int *)(self + 0x40) == 2 ? 22 : 3;
            *(int *)(self + 0x90) = target;
            break;
        case 2:
            *(int *)(self + 0x88) = 6;
            *(int *)(self + 0x8c) = 4;
            *(int *)(self + 0x90) = target;
            break;
        case 3:
            *(int *)(self + 0x88) = 6;
            *(int *)(self + 0x8c) = 5;
            *(int *)(self + 0x90) = target;
            break;
        }
        return 0;
    }
    if (to == 0 && mode != 2) {
        a = func_ov006_021b7010(base, 3, target, 0);
        b = func_ov006_021b7010(base, 1, target, 0);
        if (a + (b + func_ov006_021b7010(base, 2, target, 0)) >= 3) {
            *(int *)(self + 0x88) = 6;
            *(int *)(self + 0x8c) = 0;
            *(int *)(self + 0x90) = target;
            return 0;
        }
    }
    idx = func_ov006_021bd6bc(self, to);
    slot = (Ov006Slot *)(self + 0xa0) + to;
    end = to == 4 ? 3 : 4;
    if (slot->flag2 && slot->f8 >= slot->f10 - end) near = 1;
    else near = 0;
    count = slot->fc;
    type = func_ov006_021b6dac(base, *(int *)(self + 0x50), idx, slot->flag);
    func_ov006_021b75f0(base, from, to, target, 1);
    if (type == 1 && count > 1 && (to != 0 || *(int *)(self + 0x40) == 3)) {
        if (slot->flag) {
            if (slot->flag2 && near && count % 10 == 1) {
                slot->f8--;
                if (idx != count - 1) slot->f4++;
                changed = 1;
            }
            if (idx == count - 1) {
                if (--slot->f0 < 0) {
                    slot->f0 = 9;
                    if (changed == 0) {
                        if (--slot->f4 < 0) slot->f4 = 0;
                    }
                }
            }
        } else {
            if (slot->flag2 && near) {
                changed = 1;
                slot->f8--;
            }
            if (idx == count - 1 && changed == 0) {
                if (--slot->f4 < 0) slot->f4 = 0;
            }
        }
    }
    if (*(int *)(self + 0x50) == 0) {
        if (*(int *)(self + 0x40) != 3) *(int *)(self + 0x80) = 1;
    }
    return 1;
}

