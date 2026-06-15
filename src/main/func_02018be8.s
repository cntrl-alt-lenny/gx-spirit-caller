; func_02018be8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern GetSystemWork
        .extern func_0201aabc
        .global func_02018be8
        .arm
func_02018be8:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    ldr r2, _LIT0
    mov r1, r4
    mov r0, #0x0
    bl Fill32
    mov r0, #0x10000
    mov r3, r4
    mov r2, #0x0
    rsb r0, r0, #0x0
.L_2c:
    ldr r1, [r3, #0xc]
    add r2, r2, #0x1
    and r1, r1, r0
    orr r1, r1, r0, lsr #0x10
    str r1, [r3, #0xc]
    cmp r2, #0x56
    add r3, r3, #0x18
    bcc .L_2c
    mov r2, #0x50000
    str r2, [r4, #0x908]
    add r0, r2, #0xee000
    str r0, [r4, #0x90c]
    sub r0, r2, #0x60000
    ldr r1, [r4, #0x8d4]
    mov r2, #0x1
    and r0, r1, r0
    orr r0, r0, #0x1
    str r0, [r4, #0x8d4]
    ldr r0, [r4, #0x8d0]
    bic r0, r0, #0xf
    orr r0, r0, #0x2
    str r0, [r4, #0x8d0]
    str r2, [r4, #0x91c]
    str r2, [r4, #0x920]
    str r2, [r4, #0x924]
    mov r0, #0x0
    str r0, [r4, #0x928]
    ldr r1, [r4, #0x8d8]
    rsb r0, r2, #0x178
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x8d8]
    ldr r1, [r4, #0x900]
    orr r2, r1, #0x800
    bic r1, r2, #0x600
    orr r1, r1, #0x600
    str r1, [r4, #0x900]
    str r0, [r4, #0x8f4]
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    bic r1, r1, #0x1000
    str r1, [r0, #0x8f8]
    mov r0, #0x75
    bl func_0201aabc
    mov r0, #0x76
    bl func_0201aabc
    mov r0, #0x77
    bl func_0201aabc
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000092c
