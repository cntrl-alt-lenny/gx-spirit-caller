; func_ov006_021c11c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cdd30
        .extern data_ov006_021cdd48
        .extern data_ov006_021cdd60
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .global func_ov006_021c11c8
        .arm
func_ov006_021c11c8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r5, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    ldr r2, _LIT1
    mvn r3, #0x0
    bic r0, r0, #0xf
    orr r4, r0, #0x8
    mov r1, #0x40
    add r0, sp, #0x0
    str r5, [sp]
    strh r4, [sp, #0x14]
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r5
    bl func_02006e1c
    ldr r0, _LIT2
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
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldr r1, _LIT3
    mov r0, #0x60
    strh r0, [sp, #0x10]
    add r0, sp, #0x0
    str r1, [sp, #0xc]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    ldr r0, _LIT4
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
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldr r1, _LIT5
    mov r0, #0x80
    strh r0, [sp, #0x10]
    add r0, sp, #0x0
    str r1, [sp, #0xc]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov006_021cdd30
_LIT1: .word 0x00006440
_LIT2: .word data_ov006_021cdd48
_LIT3: .word 0x00006520
_LIT4: .word data_ov006_021cdd60
_LIT5: .word 0x00006720
