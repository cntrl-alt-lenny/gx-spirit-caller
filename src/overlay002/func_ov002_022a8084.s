; func_ov002_022a8084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc310
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02037208
        .global func_ov002_022a8084
        .arm
func_ov002_022a8084:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    ldr ip, [r0, #0x5e4]
    sub r3, r3, #0x1
    cmp r3, ip
    addne sp, sp, #0x2c
    ldmneia sp!, {r3, r4, pc}
    ldrh r3, [sp]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r3, r3, #0x1
    and r1, r1, #0x1
    orr r1, r3, r1
    strh r1, [sp]
    mov r1, r2, lsl #0x10
    ldrh r2, [sp]
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x1b
    bic r2, r2, #0x3e
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp]
    ldrh r3, [sp]
    add r2, ip, #0x1
    add r1, r0, ip, lsl #0x1
    bic r3, r3, #0x3fc0
    strh r3, [sp]
    ldrh r4, [sp]
    add r3, r1, #0x500
    str r2, [r0, #0x5e4]
    bic r1, r4, #0x4000
    strh r1, [sp]
    ldrh r2, [sp]
    mov r4, #0x10
    mov r1, #0x4
    bic r2, r2, #0x8000
    strh r2, [sp]
    ldrh ip, [sp]
    mov r2, #0x0
    strh ip, [r3, #0xc4]
    str r4, [r0, #0x5e8]
    ldr r0, _LIT0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x4
    bl func_0201d47c
    ldr r0, _LIT1
    ldrh r1, [sp, #0x18]
    str r0, [sp, #0x10]
    str r4, [sp, #0x4]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    mvn r1, #0x0
    strh r0, [sp, #0x18]
    add r0, sp, #0x4
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    mov r0, #0x36
    sub r1, r0, #0x37
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022cc310
_LIT1: .word 0x0000b980
