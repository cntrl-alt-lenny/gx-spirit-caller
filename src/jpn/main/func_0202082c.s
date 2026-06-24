; func_0202082c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02193360
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_02020870
        .extern func_0209ef7c
        .global func_0202082c
        .arm
func_0202082c:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f0e4
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    bl func_0209ef7c
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0xa
    bl func_0201f0e4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02193360
_LIT1: .word func_02020870
