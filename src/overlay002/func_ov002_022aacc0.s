; func_ov002_022aacc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc418
        .extern data_ov002_022cc434
        .extern data_ov002_022cc44c
        .extern data_ov002_022cc464
        .extern data_ov002_022cc47c
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov002_022aacc0
        .arm
func_ov002_022aacc0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0xc8
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0]
    sub r4, r0, #0x8
    ldrh r3, [r4]
    ldr r0, _LIT1
    mov r1, #0x4
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r4]
    ldrh r3, [r4]
    and r3, r3, #0x43
    orr r3, r3, #0x1c80
    strh r3, [r4]
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0xa0
    bl func_0201d47c
    mvn ip, #0x0
    ldrh r2, [sp, #0xb4]
    mov r1, #0x0
    ldr r0, [sp, #0xb8]
    bic r2, r2, #0xf
    orr r2, r2, #0x5
    strh r2, [sp, #0xb4]
    bic r2, r0, #0x1c000
    ldrh r3, [sp, #0xb4]
    add r0, sp, #0xa0
    str r4, [sp, #0xa0]
    orr r3, r3, #0x10
    str ip, [sp, #0xa8]
    str ip, [sp, #0xac]
    strh r3, [sp, #0xb4]
    str r2, [sp, #0xb8]
    strh r1, [sp, #0xb0]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x78
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r1, [sp, #0x8c]
    str r0, [sp, #0x80]
    str r4, [sp, #0x78]
    bic r0, r1, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x8c]
    mov r0, #0x2440
    str r0, [sp, #0x84]
    mov r0, #0x200
    ldrh r2, [sp, #0x8c]
    strh r0, [sp, #0x88]
    ldr r1, [sp, #0x90]
    orr r0, r2, #0x10
    strh r0, [sp, #0x8c]
    bic r0, r1, #0x1c000
    str r0, [sp, #0x90]
    add r0, sp, #0x78
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x50
    bl func_0201d47c
    ldrh r1, [sp, #0x64]
    mvn ip, #0x0
    ldr r0, [sp, #0x68]
    bic r1, r1, #0xf
    orr r1, r1, #0x5
    strh r1, [sp, #0x64]
    bic r2, r0, #0x1c000
    ldrh r3, [sp, #0x64]
    mov r1, #0x400
    add r0, sp, #0x50
    orr r3, r3, #0x10
    str r4, [sp, #0x50]
    str ip, [sp, #0x58]
    str ip, [sp, #0x5c]
    strh r3, [sp, #0x64]
    str r2, [sp, #0x68]
    strh r1, [sp, #0x60]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x30]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x3c]
    mov r0, #0x600
    ldrh r2, [sp, #0x3c]
    strh r0, [sp, #0x38]
    ldr r1, [sp, #0x40]
    orr r0, r2, #0x10
    strh r0, [sp, #0x3c]
    bic r0, r1, #0x1c000
    str r0, [sp, #0x40]
    add r0, sp, #0x28
    str r4, [sp, #0x28]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    str r4, [sp]
    bic r0, r1, #0xf
    orr r0, r0, #0x5
    strh r0, [sp, #0x14]
    mov r0, #0x2240
    str r0, [sp, #0xc]
    mov r0, #0x800
    ldrh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    ldr r1, [sp, #0x18]
    orr r0, r2, #0x10
    strh r0, [sp, #0x14]
    bic r0, r1, #0x1c000
    str r0, [sp, #0x18]
    add r0, sp, #0x0
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    add sp, sp, #0xc8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x04001010
_LIT1: .word data_ov002_022cc418
_LIT2: .word data_ov002_022cc434
_LIT3: .word data_ov002_022cc44c
_LIT4: .word data_ov002_022cc464
_LIT5: .word data_ov002_022cc47c
