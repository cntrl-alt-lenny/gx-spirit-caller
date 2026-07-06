; func_ov002_0227aaac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf08c
        .extern func_ov002_0227a80c
        .global func_ov002_0227aaac
        .arm
func_ov002_0227aaac:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    and r5, r0, #0x1
    ldr r2, _LIT1
    mov r0, #0x14
    mla r2, r5, r2, r3
    mul r0, r1, r0
    ldr r3, _LIT2
    add r2, r2, #0x30
    ldr r4, [r2, r0]
    ldr ip, [r3]
    mov r1, r1, lsl #0x1c
    bic r0, ip, #0x1
    orr r5, r0, r5
    bic r5, r5, #0x1e
    mov r0, r4, lsl #0x2
    orr r1, r5, r1, lsr #0x1b
    mov lr, r0, lsr #0x18
    mov r0, r4, lsl #0x13
    orr r1, r1, #0x20
    bic r5, r1, #0xc0
    mov ip, r0, lsr #0x13
    ldr r2, _LIT3
    mov r1, lr, lsl #0x1
    mov r4, r4, lsl #0x12
    and lr, r5, r2
    add r1, r1, r4, lsr #0x1f
    orr r4, lr, r1, lsl #0x17
    rsb r1, r2, #0xfe
    and r2, r4, r1
    mov r1, ip, lsl #0x11
    mov r0, #0x0
    str r5, [r3]
    strb r0, [r3, #0x9]
    strb r0, [r3, #0x8]
    orr r1, r2, r1, lsr #0x9
    str r1, [r3]
    ldrh r2, [r3, #0x16]
    mov r1, #0x1
    bic r2, r2, #0x700
    orr r2, r2, #0x200
    strh r2, [r3, #0x16]
    strh r1, [r3, #0x4]
    strh r0, [r3, #0x6]
    bl func_ov002_0227a80c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cd220
_LIT3: .word 0x007fffff
