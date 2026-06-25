; func_ov008_021b2064 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f85d0
        .extern data_ov008_021b270c
        .extern data_ov008_021b2744
        .extern data_ov008_021b2780
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0200ad0c
        .extern func_0200f854
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02021064
        .extern func_02021190
        .extern func_020211b4
        .extern func_020211c8
        .extern func_0202147c
        .extern func_0202c948
        .extern func_02094504
        .global func_ov008_021b2064
        .arm
func_ov008_021b2064:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, #0x90
    bl func_02094504
    ldr r1, _LIT0
    mov ip, #0x0
    ldr r2, [r1]
    ldr r0, _LIT1
    str ip, [r2, #0xc]
    ldrh r4, [r0, #0x10]
    ldr r2, [r1]
    mov r3, #0x100
    str r4, [r2, #0x10]
    ldr r2, [r1]
    str r3, [r2, #0x1c]
    ldr r2, [r1]
    strb ip, [r2, #0x70]
    ldr r2, [r0, #0x14]
    ldr r0, [r1]
    str r2, [r0, #0x14]
    bl func_02021064
    mov r0, #0x0
    mov r1, #0x1
    bl func_02021190
    mov r0, #0x3
    mov r1, #0x8
    bl func_020211b4
    mov r0, #0x8
    bl func_0200ad0c
    mov r0, #0x3000
    str r0, [sp]
    mov r0, #0x3
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f854
    mov r0, #0x1
    mov r1, #0x2
    bl func_0202c948
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x4
    bl func_0201d47c
    mvn r0, #0x0
    ldrh r1, [sp, #0x18]
    str r0, [sp, #0xc]
    str r4, [sp, #0x4]
    bic r0, r1, #0xf
    orr r0, r0, #0x1
    strh r0, [sp, #0x18]
    mov r0, #0x5200
    str r0, [sp, #0x10]
    mov r0, #0x80
    strh r0, [sp, #0x14]
    add r0, sp, #0x4
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT3
    bl func_020211c8
    ldr r1, _LIT0
    ldr r2, [r1]
    str r0, [r2]
    ldr r0, [r1]
    ldr r0, [r0]
    bl func_0202147c
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov008_021b270c
_LIT1: .word data_ov008_021b2780
_LIT2: .word data_ov008_021b2744
_LIT3: .word data_020f85d0
