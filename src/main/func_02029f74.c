typedef struct {
 char pad0[0x6c];
 unsigned char kind1; char pad6d[7]; int dest1;
 unsigned char kind2; char pad79[7]; int dest2;
 char pad84[0x104]; unsigned short *buffer;
 char pad18c[6]; short amount, duration, step; char pad198[2];
 unsigned short b0:1, b1:1, b2:1;
} Obj;
extern void *Task_PostLocked(int size, int align, int flags);
extern void Task_InvokeLocked(void *p);
extern int func_02029c80(Obj *o, void *buffer, int dest, int size);
extern int func_020b3870(int numerator, int denominator);
int func_02029f74(Obj *o) {
 long i; int n, dest, size;
 unsigned short *out;
 int scale, green, blue, half, amount; long bias, remain, phase;
 if (o->b2) {
  dest = o->dest1;
  n = o->kind1 == 1 ? 0x100 : 0x10;
 } else {
  dest = o->dest2;
  n = o->kind2 == 1 ? 0x100 : 0x10;
 }
 size = n * 2;
 out = Task_PostLocked(size, 4, 0);

 i = 0;
 half = o->duration / 2;
 phase = o->step;
 if (phase > half) phase = o->duration - phase;
 amount = o->amount;
 if (amount < 0) amount = -amount;
 scale = 16 - amount;


 if (n > 0) do {
  int red, r, g, b;
  int color = o->buffer[i];
  bias = amount * 31;
  remain = half - phase;
  red = color & 31;
  green = (color >> 5) & 31;
  blue = (color >> 10) & 31;
  if (o->amount >= 0) {
   r = (red * scale + bias) / 16;
   g = (green * scale + bias) / 16;
   b = (blue * scale + bias) / 16;
  } else {
   r = red * scale / 16;
   g = green * scale / 16;
   b = blue * scale / 16;
  }
  red = func_020b3870(r * phase + red * remain, half);
  blue = func_020b3870(b * phase + blue * remain, half);
  green = func_020b3870(g * phase + green * remain, half);
  out[i] = (red & 31) | ((unsigned short)((blue & 31) << 10) | ((green & 31) << 5));
  i++;
 } while (i < n);
 func_02029c80(o, out, dest, size);
 Task_InvokeLocked(out);
 o->step++;
 if (o->step >= o->duration) o->step = 0;
 return 1;
}












