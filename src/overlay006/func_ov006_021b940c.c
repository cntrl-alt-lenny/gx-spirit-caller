extern int func_0202bb20(int), func_0202de9c(int), func_0202b950(int), func_0202b980(int), func_0202bb78(int);
extern unsigned short func_0202b33c(int), func_0202b0b4(int);
extern unsigned int func_0202b890(int), func_0202b878(int), func_0202b8a8(int), func_0202b8c0(int);
extern unsigned short data_ov006_0224f3e0[];
extern int data_ov006_021cb348[], data_ov006_021cb370[], data_ov006_021cb2d8[], data_ov006_021cb2f4[];
extern unsigned char data_ov006_0225bee0[];
#define CATEGORY() u=func_0202de9c(x); v=func_0202de9c(y); p=u==7?254:u==8?255:0; q=v==7?254:v==8?255:0; if(p!=q)return p-q
#define SCORE(mask,fn) if(data_ov006_0224f3e0[0] & mask) { CATEGORY(); if(p==0) { u=vx?(short)fn(x):-2; v=vy?(short)fn(y):-2; if(u!=v)return v-u; } }
#define TABLE(mask,fn,t) if(data_ov006_0224f3e0[0] & mask) { CATEGORY(); if(p==0) { u=fn(x); v=fn(y); p=vx?t[u]:255; q=vy?t[v]:255; if(p!=q)return p-q; } }
int func_ov006_021b940c(unsigned short *a, unsigned short *b) {
 int vx, vy, x, y, u, v, p, q; x=*a; y=*b; vx=func_0202bb20(x); vy=func_0202bb20(y);
 if(data_ov006_0224f3e0[0]&1){u=func_0202b33c(x);v=func_0202b33c(y);if(u!=v)return u-v;}
 if(data_ov006_0224f3e0[0]&2){u=func_0202de9c(x);v=func_0202de9c(y);if(u!=v)return u-v;}
 SCORE(4,func_0202b950)
 SCORE(8,func_0202b980)
 TABLE(16,func_0202b890,data_ov006_021cb348)
 TABLE(32,func_0202b878,data_ov006_021cb370)
 if(data_ov006_0224f3e0[0]&64){CATEGORY();if(p==0){u=vx?func_0202b8a8(x):-1;v=vy?func_0202b8a8(y):-1;if(u!=v)return v-u;}}
 if(data_ov006_0224f3e0[0]&128){u=func_0202de9c(x);v=func_0202de9c(y);p=u==7?-2:u==8?-1:u;q=v==7?-2:v==8?-1:v;if(p!=q)return p-q;
 if(u==7){u=func_0202b8c0(x);v=func_0202b8c0(y);p=vx?data_ov006_021cb2d8[u]:255;q=vy?data_ov006_021cb2d8[v]:255;if(p!=q)return p-q;}
 else if(u==8){u=func_0202b8c0(x);v=func_0202b8c0(y);p=vx?data_ov006_021cb2f4[u]:255;q=vy?data_ov006_021cb2f4[v]:255;if(p!=q)return p-q;}}
 if(data_ov006_0224f3e0[0]&256){u=vx?data_ov006_0225bee0[func_0202b0b4(x)]:255;v=vy?data_ov006_0225bee0[func_0202b0b4(y)]:255;if(u!=v)return u-v;}
 if(data_ov006_0224f3e0[0]&512){u=vx?(func_0202bb78(x)!=0):-1;v=vy?(func_0202bb78(y)!=0):-1;if(u!=v)return v-u;}
 if(data_ov006_0224f3e0[0]&0x4000){u=func_0202de9c(x);v=func_0202de9c(y);if(u!=v)return u-v;}
 if(data_ov006_0224f3e0[0]&0x8000){u=func_0202b33c(x);v=func_0202b33c(y);if(u!=v)return u-v;}
 return x-y;
}

