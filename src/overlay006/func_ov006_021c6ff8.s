; func_ov006_021c6ff8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_0208e014
        .extern func_0208e120
        .extern func_0208ffec
        .extern func_02094504
        .global func_ov006_021c6ff8
        .arm
func_ov006_021c6ff8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe00
    strh r0, [r1]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    strh r0, [r1, #0x2]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0xf00
    strh r0, [r1, #0x2]
    bl func_0208e120
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    bl func_0208e014
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    add r0, r4, #0x4
    mov r1, #0x20
    mov r2, #0x3
    bl func_02001d0c
    bl func_0208e120
    mov r2, #0x1
    mov r1, r0
    add r0, r4, #0x4
    mov r3, r2
    bl func_02001e94
    add r0, r4, #0x4
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001d0c
    bl func_0208e014
    add r1, r0, #0x580
    add r0, r4, #0x4
    mov r2, #0x61
    mov r3, #0x2
    bl func_02001e94
    mov r1, #0x13
    add r0, r4, #0x4
    mov r2, r1
    bl func_02001d0c
    bl func_0208e014
    mov r1, r0
    add r0, r4, #0x4
    add r1, r1, #0xd8
    mov r2, #0xa1
    mov r3, #0x2
    bl func_02001e94
    mov r1, #0x20
    ldr r0, _LIT1
    mov r2, r1
    bl func_0208ffec
    ldr r0, _LIT1
    mov r1, #0x40
    mov r2, #0x20
    bl func_0208ffec
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400000c
_LIT1: .word data_020b4728
