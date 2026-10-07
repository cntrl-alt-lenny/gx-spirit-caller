extern unsigned char data_020beea4[];
typedef struct { void *vtable; int a, b, state; } Object;
void func_0207deb0(Object *object, int a, int b)
{
    object->vtable = data_020beea4;
    object->a = a; object->b = b; object->state = 0;
}
