typedef unsigned int u32;
struct M { int v[16]; };
typedef struct { u32 *words; u32 size; } List;
typedef struct { char pad[0x41]; signed char cb1,cb2,visible; short count,start; char tail[0x20]; } Node;
typedef struct { int count; int pad; unsigned char *values; } Track;
typedef struct { int count; Track **tracks; } Anim;
typedef struct { int pad; signed int frame:10; signed int rest:22; } State;
typedef struct Obj {
 void *p0; List *lists; Node *nodes; void *p0c; int matrices; signed char *indices;
 char pad18[0x3c]; void (*callback)(struct Obj *,int); char pad58[8];
 unsigned int low60:4; unsigned int flag60:1; unsigned int high60:27;
 char pad64[8]; u32 mask; char pad70[12];
 unsigned int low7c:30; unsigned int flag7c:1; unsigned int high7c:1;
 char pad80[0x24]; Anim *anim; State *states; char padac[0x1d4]; struct M **transforms;
} Obj;
extern int func_0200cf88(Obj *,int);
extern int func_0208e420(int x);
extern void func_0208ea74(struct M *m);
extern void func_01ff87c0(u32,void *,u32);
extern signed char data_020b4908[];
extern u32 data_0210249c;
extern unsigned short data_02186ae8[];
void func_0200da18(Obj *obj,int idx) {
 Node *node;
 int visible;
 int pos,next,i;
 int listidx;
 if (!obj) return;
 node=&obj->nodes[idx];
 if (!node) return;
 visible=node->visible;
 if(obj->flag60) {
  visible=1;
  if(!(obj->mask & (1<<idx))) visible=0;
 }
 if(obj->anim) {
  Track *track=obj->anim->tracks[idx];
  State *state=&obj->states[idx];
  if(track->count) visible=track->values[state->frame];
 }
 if(node->count>0 && visible) {
  pos=node->start;
  i=0;
  next=pos+1;
  for(;i<node->count;i++,pos+=2,next+=2) {
   if(func_0200cf88(obj,obj->indices[pos])) {
    listidx=obj->indices[next];
    if(obj->flag7c) {
     u32 *words;
     int j;
     int count=obj->lists[listidx].size>>2;
     unsigned short color=data_02186ae8[2];
     words=obj->lists[listidx].words;
     j=0;
     for(;j<count;) {
      int cmd=words[j];
      int n=data_020b4908[cmd];
      if(cmd==0x30) words[j+1]=(unsigned short)words[j+1] | (color<<16);
      j+=n+1;
     }
    }
    if(obj->transforms && obj->transforms[obj->indices[pos]]) {
     func_0208ea74(obj->transforms[obj->indices[pos]]);
     *(volatile u32 *)0x04000440=2;
    }
    if(!obj->matrices) {
     func_01ff87c0(data_0210249c,obj->lists[listidx].words,obj->lists[listidx].size);
    } else {
     u32 *words;
     int k;
     int count=obj->lists[listidx].size>>2;
     int j=0;
     words=obj->lists[listidx].words;
     for(;j<count;) {
      int cmd=words[j];
      if(cmd==0x14) {
       k=words[j+1];
       *(volatile u32 *)0x04000440=2;
       func_0208e420(obj->matrices+(k*2+1)*0x30);
       *(volatile u32 *)0x04000440=1;
       func_0208e420(obj->matrices+k*0x60);
       j+=data_020b4908[cmd]+1;
      } else {
       k=j;
       for(;k<count;) {
        int c=words[k];
        int n=data_020b4908[c];
        if(c==0x14) break;
        k+=n+1;
       }
       func_01ff87c0(data_0210249c,&words[j],(k-j)*4);
       j=k;
      }
     }
    }
    *(volatile u32 *)0x04000480=0x7fff;
   }
  }
 }
 if(node->cb1!=-1) obj->callback(obj,node->cb1);
 if(node->cb2!=-1) obj->callback(obj,node->cb2);
}



