; func_02092ec0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6550
        .extern data_021a6554
        .extern data_021a655c
        .extern func_02092e4c
        .extern func_02092e5c
        .global func_02092ec0
        .arm
func_02092ec0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    mov r0, sp
    ldr r1, _LIT1
    msr CPSR_fsxc, r1
    mov sp, r0
    bl func_02092e4c
    ldr r1, _LIT2
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r2, [r0]
    ldr r0, _LIT3
    blx r2
    bl func_02092e5c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6550
_LIT1: .word 0x0000009f
_LIT2: .word data_021a6554
_LIT3: .word data_021a655c
