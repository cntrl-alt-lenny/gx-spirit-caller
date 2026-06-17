/* func_0201ca34: reset a record block — zero two header words, then tail-call the
 * clear helper func_02094500(buf, 0, 64). */
extern int data_0218fddc[];
extern char data_0218fe2c[];
extern void func_02094500(void *, int, int);
void func_0201ca34(void){
    data_0218fddc[7] = 0;
    data_0218fddc[0] = 0;
    func_02094500(data_0218fe2c, 0, 64);
}
