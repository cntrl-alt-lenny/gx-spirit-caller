#include "runtime/intrinsics.h"
typedef struct { char _0[0x18]; int table; } rec_02068b54_t;
extern void func_02068b54(rec_02068b54_t *rec, int name, int value);
extern int func_0206b44c(signed char *s, int n);
extern int func_020a978c(char *dst, const char *fmt, ...);
extern int func_020aaddc(const char *s);
extern const char data_02101d54[];
typedef struct { unsigned char a, b; } BytePair;

void func_02068628(rec_02068b54_t *rec, signed char *p, int n) {
    int len;
    signed char *key;
    signed char *names;
    int group, count, row, col;
    union { unsigned short value; BytePair bytes; } h;
    char buf[128];
    while (*p) {
        len = func_0206b44c(p,n);
        if (len < 0) return;
        key = p;
        n -= len;
        p += len;
        len = func_0206b44c(p,n);
        if (len < 0) return;
        {
            signed char *value = p;
            p += len;
            n -= len;
            func_02068b54(rec, (int)key, (int)value);
        }
    }
    p++;
    n--;
    for (group=0; group<2; group++) {
        if (n<2) return;
        __memcpy(&h,p,2);
        p += 2;
        names = p;
        h.value = ((h.value >> 8) & 0xff) | ((h.value << 8) & 0xff00);
        count=0;
        n -= 2;
        while (*p) {
            len=func_0206b44c(p,n);
            if (len<0) return;
            if (len>100) return;
            p+=len;
            n-=len;
            count++;
        }
        p++;
        n--;
        for(row=0;row<h.value;row++) {
            key=names;
            for(col=0;col<count;col++) {
                len=func_0206b44c(p,n);
                if(len<0) return;
                func_020a978c(buf,data_02101d54,key,row);
                func_02068b54(rec,(int)buf,(int)p);
                p+=len;
                n-=len;
                key+=func_020aaddc((const char *)key)+1;
            }
        }
    }
}











