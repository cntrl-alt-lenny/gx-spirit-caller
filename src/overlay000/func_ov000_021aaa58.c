/* func_ov000_021aaa58: refresh the active object's snapshot — copy the live
 * (x,y,z) to the prev slot and record the delta from the params. */
extern void func_ov000_021aa7e0(int a);
extern char data_ov000_021c73e0[];
void func_ov000_021aaa58(int a0, int a1, int a2) {
    int *obj = *(int **)data_ov000_021c73e0;
    func_ov000_021aa7e0(1);
    obj[33] = obj[12];
    obj[34] = obj[13];
    obj[35] = obj[14];
    obj[54] = a0 - obj[12];
    obj[55] = a1 - obj[13];
    obj[56] = a2 - obj[14];
    *(short *)((char *)obj + 318) = 256;
}
