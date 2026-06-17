/* func_020623f4: pattern 6 sibling, f12=0 and f16=1. */
struct Func02062468Target { char pad[12]; int f12; int f16; };
extern int func_020647f0(void);

int func_020623f4(int arg0, struct Func02062468Target **pp) {
    int r = func_020647f0();
    if (r) return r;
    (*pp)->f12 = 0;
    (*pp)->f16 = 1;
    return 0;
}
