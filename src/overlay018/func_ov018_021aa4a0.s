; func_ov018_021aa4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov018_021ad860
        .extern data_ov018_021ad8a8
        .extern data_ov018_021ae160
        .extern Task_Invoke
        .extern func_0201e5b8
        .global func_ov018_021aa4a0
        .arm
func_ov018_021aa4a0:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    ldr r2, _LIT1
    ldr ip, [r3, #0x96c]
    ldr r4, [r3, #0x970]
    mov r1, r2, lsl #0x10
    ldr r0, _LIT2
    and ip, ip, r2
    and r1, r1, r4, lsl #0x10
    orr r1, ip, r1
    str r1, [r0]
    ldr ip, [r3, #0x974]
    ldr r4, [r3, #0x978]
    mov r1, r2, lsl #0x10
    and ip, ip, r2
    and r1, r1, r4, lsl #0x10
    orr r1, ip, r1
    str r1, [r0, #0x4]
    ldr ip, [r3, #0x97c]
    ldr r4, [r3, #0x980]
    mov r1, r2, lsl #0x10
    and ip, ip, r2
    and r1, r1, r4, lsl #0x10
    orr r1, ip, r1
    str r1, [r0, #0x8]
    ldr ip, [r3, #0x984]
    ldr r4, [r3, #0x988]
    mov r1, r2, lsl #0x10
    and ip, ip, r2
    and r1, r1, r4, lsl #0x10
    orr r1, ip, r1
    str r1, [r0, #0xc]
    ldr ip, [r3, #0x98c]
    ldr r4, [r3, #0x990]
    mov r1, r2, lsl #0x10
    and ip, ip, r2
    and r1, r1, r4, lsl #0x10
    orr r1, ip, r1
    add r0, r0, #0x1000
    str r1, [r0]
    ldr r4, [r3, #0x994]
    ldr r1, [r3, #0x998]
    mov r0, r2, lsl #0x10
    and r1, r0, r1, lsl #0x10
    and r4, r4, r2
    ldr r0, _LIT3
    orr r1, r4, r1
    str r1, [r0]
    ldr ip, [r3, #0x99c]
    ldr r4, [r3, #0x9a0]
    mov r1, r2, lsl #0x10
    and ip, ip, r2
    and r1, r1, r4, lsl #0x10
    orr r1, ip, r1
    str r1, [r0, #0x4]
    ldr r4, [r3, #0x9a4]
    mov r1, r2, lsl #0x10
    ldr r3, [r3, #0x9a8]
    and r2, r4, r2
    and r1, r1, r3, lsl #0x10
    orr r2, r2, r1
    ldr r1, _LIT4
    str r2, [r0, #0x8]
    ldrh r0, [r1, #0xfc]
    ldr r4, _LIT5
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x18c
    add r0, r0, #0x800
    bl func_0201e5b8
    ldr r0, [r4, #0x988]
    bl Task_Invoke
    add r0, r4, #0x900
    ldrh r1, [r0, #0xb4]
    mov r2, #0x0
    str r2, [r4, #0x988]
    bic r1, r1, #0x8
    strh r1, [r0, #0xb4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov018_021ad860
_LIT1: .word 0x000001ff
_LIT2: .word 0x04000010
_LIT3: .word 0x04001014
_LIT4: .word data_ov018_021ae160
_LIT5: .word data_ov018_021ad8a8
