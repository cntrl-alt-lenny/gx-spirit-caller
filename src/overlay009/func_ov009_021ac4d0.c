
extern unsigned short data_02104bac[];
extern unsigned short data_ov009_021adac0[], data_ov009_021ada90[], data_ov009_021ada9c[], data_ov009_021adacc[];
extern int data_ov009_021adbcc[], data_ov009_021adc00[];
extern unsigned int func_02006164(void), func_0200617c(void);
extern void *func_020061ac(void);
extern int func_02022234(unsigned int, unsigned int);
extern int func_0202224c(int);
extern int func_0202cdf8(void);
extern void func_0202ce24(void);
extern int func_02037208(int,int,int,int);
extern int func_ov009_021aa4a8(int *, unsigned int);
/* The original passes the dialog pointer; the current C callee declares void. */
extern int func_ov009_021aa59c(int *);
extern int func_ov009_021aa5d8(int *);
extern int func_ov009_021aaaec(int *);
extern int func_ov009_021ab74c(int *,int,int);
extern int func_ov009_021ab7b4(int *,int);
extern int func_ov009_021ac458(int, unsigned short *);
extern void func_ov009_021ace60(int *);
extern int func_ov009_021acf1c(void *);
extern int func_ov009_021acff8(int *);
int func_ov009_021ac4d0(int *s) {
 unsigned short keys = data_02104bac[0x2b];
 switch(s[10]) {
 case 0:
 if(data_02104bac[0x29] != 0) {
 unsigned short pressed = data_02104bac[0x2a];
 if(pressed & 1) {
 s[15]=0;
 
switch(s[14]) {
case 3:
 if(s[13]>0) { func_02037208(0x3a, -1, 0, 1); 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 }
 else { func_02037208(0x43, -1, 0, 1); }
 break;
case 2:
 func_02037208(0x3a, -1, 0, 1);
 if(s[13]>0) { 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 }
 else { s[6]=-1; s[7]=7; }
 break;
case 1:
 if(s[13]>0) { func_02037208(0x3a, -1, 0, 1); 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 }
 else return func_ov009_021acff8(s);
 break;
case 0:
 switch(s[13]) {
 case 1: func_02037208(0x3a, -1, 0, 1); 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 break;
 case 2: func_02037208(0x38, -1, 0, 1); if(s[7]<7) s[7]++; break;
 case 3: func_02037208(0x38, -1, 0, 1); if(s[7]>0) s[7]--; break;
 case 0: return func_ov009_021acff8(s);
 } break;
}

 } else if(keys & 0x200) {
 if(s[7]<7) { s[7]++; func_02037208(0x38, -1, 0, 1); }
 } else if(keys & 0x100) {
 if(s[7]>0) { s[7]--; func_02037208(0x38, -1, 0, 1); }
 } else if(pressed & 2) {
 if(s[7]==7) { func_02037208(0x42, -1, 0, 1); func_02022234(0,func_0202224c(0)|1); return 1; }
 else { func_02037208(0x43, -1, 0, 1); s[7]++; }
 } else if(keys & 0x20) { func_02037208(0x38, -1, 0, 1); if(--s[13]<0) s[13]=3; }
 else if(keys & 0x10) { func_02037208(0x38, -1, 0, 1); if(++s[13]>=4) s[13]=0; }
 else if(keys & 0x40) { func_02037208(0x38, -1, 0, 1); if(++s[14]>=4) s[14]=0; }
 else if(keys & 0x80) { func_02037208(0x38, -1, 0, 1); if(--s[14]<0) s[14]=3; }
 } else {
 if(func_020061ac()!=0) func_ov009_021ace60(s);
 if(func_ov009_021ac458((int)s,data_ov009_021adac0)!=0 && func_02006164()!=0) {
 func_02037208(0x42, -1, 0, 1); func_02022234(0,func_0202224c(0)|1); return 1;
 }
 if(func_ov009_021ac458((int)s,data_ov009_021ada90)!=0) {
 s[12]++;
 if(s[12]>=20) {
 s[12]-=6;
 if(s[7]<7) { s[7]++; func_02037208(0x38, -1, 0, 1); }
 }
 }
 if(func_ov009_021ac458((int)s,data_ov009_021ada9c)!=0) {
 s[12]++;
 if(s[12]>=20) {
 s[12]-=6;
 if(s[7]>0) { s[7]--; func_02037208(0x38, -1, 0, 1); }
 }
 }
 if(func_0200617c()!=0 && s[15]==0) {
 s[12]=0;
 
switch(s[14]) {
case 3:
 if(s[13]>0) { func_02037208(0x3a, -1, 0, 1); 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 }
 else { func_02037208(0x43, -1, 0, 1); }
 break;
case 2:
 func_02037208(0x3a, -1, 0, 1);
 if(s[13]>0) { 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 }
 else { s[6]=-1; s[7]=7; }
 break;
case 1:
 if(s[13]>0) { func_02037208(0x3a, -1, 0, 1); 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 }
 else return func_ov009_021acff8(s);
 break;
case 0:
 switch(s[13]) {
 case 1: func_02037208(0x3a, -1, 0, 1); 
    s[6] &= ~(0xf << (s[7] * 4));
    s[6] |= func_ov009_021acf1c(s) << (s[7] * 4);
    if (s[7] > 0) s[7]--;
 break;
 case 2: func_02037208(0x38, -1, 0, 1); if(s[7]<7) s[7]++; break;
 case 3: func_02037208(0x38, -1, 0, 1); if(s[7]>0) s[7]--; break;
 case 0: return func_ov009_021acff8(s);
 } break;
}

 }
 } break;
 case 1: {
 int ready=func_ov009_021aa5d8(data_ov009_021adbcc);
 if(data_ov009_021adc00[1]==0x80) { func_02037208(0x98, -1, 0, 1); }
 if(data_ov009_021adc00[1]==0x100) {
 if(s[0]>0) { data_ov009_021adc00[0]=2; func_02037208(0x99, -1, 0, 1); }
 else { data_ov009_021adc00[0]=3; func_02037208(0x9a, -1, 0, 1); }
 }
 if(data_ov009_021adc00[1]==0x178) data_ov009_021adbcc[1]=1;
 if(data_ov009_021adc00[1]>0x180 && ready!=0) {
 if(s[0]>0) {
 func_ov009_021ab7b4(data_ov009_021adc00,1);
 func_ov009_021ab74c(data_ov009_021adc00,s[8],1);
 func_ov009_021aa4a8(data_ov009_021adbcc,0);
 func_02037208(0x5f, -1, 0, 1);
 } else func_ov009_021aa4a8(data_ov009_021adbcc,1);
 s[10]=2;
 }
 } break;
 case 2:
 if(func_0202cdf8()!=0 && func_ov009_021ac458((int)s,data_ov009_021adacc)!=0 && func_02006164()!=0) func_0202ce24();
 if(func_ov009_021aa5d8(data_ov009_021adbcc)!=0) s[10]=3;
 func_ov009_021aaaec(data_ov009_021adbcc);
 break;
 case 3:
 if(func_ov009_021aa59c(data_ov009_021adbcc)!=0) {
 data_ov009_021adc00[1]=0;
 data_ov009_021adc00[0]=0;
 func_ov009_021ab7b4(data_ov009_021adc00,0);
 if(data_ov009_021adbcc[0]!=0) s[7]=7;
 s[10]=0;
 }
 break;
 }
 return 0;
}

