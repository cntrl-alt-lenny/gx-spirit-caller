; func_0202d2dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be9ac
        .extern data_020c6cf8
        .extern data_0219ad48
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201d530
        .extern func_0201e5b8
        .extern func_02091554
        .extern func_02094504
        .global func_0202d2dc
        .arm
func_0202d2dc:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x48
    ldr r1, _LIT0
    add r2, r0, #0x16
    ldr r3, [r1, #0x20]
    cmp r3, r2
    addeq sp, sp, #0x48
    ldmeqia sp!, {r3, pc}
    str r2, [r1, #0x20]
    cmp r0, #0x0
    beq .L_56c
    ldr r1, _LIT1
    sub r0, r0, #0x1
    ldr r2, [r1, r0, lsl #0x2]
    ldr r1, _LIT2
    add r0, sp, #0x0
    bl func_02091554
    add r0, sp, #0x20
    bl func_0201d47c
    add r0, sp, #0x0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x20]
    ldr r0, _LIT0
    ldrh ip, [sp, #0x34]
    ldr r0, [r0, #0x6c]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mvn r3, #0x0
    mov r1, #0x60
    bic ip, ip, #0xf
    and r0, r0, #0xf
    orr ip, ip, r0
    add r0, sp, #0x20
    strh ip, [sp, #0x34]
    str r3, [sp, #0x28]
    str r2, [sp, #0x2c]
    strh r1, [sp, #0x30]
    bl func_0201e5b8
    ldr r0, [sp, #0x20]
    bl Task_Invoke
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
.L_56c:
    ldr r0, [r1, #0x6c]
    bl func_0201d530
    add r0, r0, #0x160
    add r1, r0, #0x2000
    mov r0, #0x0
    mov r2, #0x80
    bl func_02094504
    add sp, sp, #0x48
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219ad48
_LIT1: .word data_020be9ac
_LIT2: .word data_020c6cf8
_LIT3: .word 0x00002160
