; func_ov002_022b32c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104f4c
        .extern data_ov002_022cc92c
        .extern data_ov002_022cca9c
        .extern data_ov002_022ccabc
        .extern data_ov002_022ccadc
        .extern data_ov002_022cd73c
        .extern func_02006b10
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .global func_ov002_022b32c8
        .arm
func_ov002_022b32c8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x48
    mov r5, r1
    mov r1, r2
    add r2, r0, r5, lsl #0x2
    str r1, [r2, #0x34]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    addeq sp, sp, #0x48
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r2, #0x2c]
    cmp r2, #0x0
    bne .L_b8
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r5, r0
    bne .L_80
    ldr r0, _LIT1
    ldr r3, _LIT2
    ldr r4, [r0, #0xba8]
    ldr r3, [r3, r1, lsl #0x2]
    and r2, r4, #0x3e0
    mov r2, r2, asr #0x5
    and ip, r4, #0x1f
    mov r0, #0xa
    sub r4, r2, #0x1
    mla r2, r4, r0, ip
    ldr r1, _LIT3
    add r0, sp, #0x28
    bl func_02091554
    b .L_cc
.L_80:
    ldr r0, _LIT4
    ldr r3, _LIT2
    ldr r4, [r0, #0xa64]
    ldr r3, [r3, r1, lsl #0x2]
    and r2, r4, #0x3e0
    mov r2, r2, lsr #0x5
    and ip, r4, #0x1f
    mov r0, #0xa
    sub r4, r2, #0x1
    mla r2, r4, r0, ip
    ldr r1, _LIT3
    add r0, sp, #0x28
    bl func_02091554
    b .L_cc
.L_b8:
    ldr r3, _LIT2
    add r0, sp, #0x28
    ldr r3, [r3, r1, lsl #0x2]
    ldr r1, _LIT5
    bl func_02091554
.L_cc:
    add r0, sp, #0x28
    bl func_02006b10
    cmp r0, #0x0
    bne .L_e8
    ldr r1, _LIT6
    add r0, sp, #0x28
    bl func_02091554
.L_e8:
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r1, [sp, #0x14]
    ldr r0, _LIT0
    str r4, [sp]
    ldr r0, [r0, #0x4]
    bic r1, r1, #0xf
    cmp r5, r0
    orr r1, r1, #0x4
    moveq r2, #0x400
    strh r1, [sp, #0x14]
    movne r2, #0x1400
    mvn r1, #0x0
    add r0, sp, #0x0
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_021040ac
_LIT2: .word data_ov002_022cc92c
_LIT3: .word data_ov002_022cca9c
_LIT4: .word data_02104f4c
_LIT5: .word data_ov002_022ccabc
_LIT6: .word data_ov002_022ccadc
