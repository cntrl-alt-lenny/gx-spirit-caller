; func_02018fbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013a50
        .extern func_02018fa0
        .global func_02018fbc
        .arm
func_02018fbc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x91c]
    bl func_02013a50
    ldr r1, [r4, #0x924]
    cmp r1, #0x2
    subhi r0, r1, #0x1
    strhi r0, [r4, #0x924]
    bhi .L_64
    mov r2, #0x1
    str r2, [r4, #0x924]
    ldr r1, [r4, #0x928]
    cmp r1, #0x0
    bne .L_64
    ldr r1, [r4, #0x920]
    add r1, r1, r5
    cmp r1, r0
    strls r1, [r4, #0x920]
    bls .L_64
    mov r0, r2
    bl func_02018fa0
    mov r0, #0x1
    str r0, [r4, #0x920]
.L_64:
    ldr r0, [r4, #0x8d8]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8d8]
    ldmia sp!, {r3, r4, r5, pc}
