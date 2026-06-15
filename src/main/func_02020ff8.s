; func_02020ff8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern func_020056a4
        .extern func_02005f2c
        .extern func_02006164
        .extern func_02020d84
        .extern func_02091a8c
        .global func_02020ff8
        .global .L_02021008
        .global .L_02021018
        .arm
func_02020ff8:
    stmdb sp!, {r3, lr}
    mov r0, #0x1
    bl func_02020d84
.L_304:
    b .L_304
.L_02021008:
    stmdb sp!, {r3, lr}
    mov r0, #0x4
    bl func_02020d84
.L_314:
    b .L_314
.L_02021018:
    stmdb sp!, {r3, r4, r5, lr}
    mov r0, #0x5
    bl func_02020d84
    ldr r4, _LIT0
    mov r5, #0x0
.L_32c:
    bl func_020056a4
    bl func_02005f2c
    bl func_02006164
    cmp r0, #0x0
    bne .L_358
    ldrh r0, [r4, #0x54]
    tst r0, #0x1
    bne .L_358
    mov r0, r5
    bl func_02091a8c
    b .L_32c
.L_358:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104bac
