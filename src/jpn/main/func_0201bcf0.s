; func_0201bcf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_0201908c
        .extern func_020190b8
        .extern func_0201b7a0
        .global func_0201bcf0
        .arm
func_0201bcf0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    ldreq r0, [r0, #0x918]
    cmpeq r0, #0x0
    bne .L_198
    bl func_02013990
    cmp r0, #0x0
    bne .L_198
    bl func_020190b8
    cmp r0, #0x0
    beq .L_198
    mov r0, r4
    bl func_0201b7a0
    cmp r0, #0x5
    beq .L_14c
    mov r0, r4
    bl func_0201b7a0
    cmp r0, #0x4
    bne .L_198
.L_14c:
    bl func_0201908c
    cmp r0, #0x1
    mov r0, r4
    bne .L_17c
    bl func_0201b7a0
    cmp r0, #0x4
    ldr r0, [r4, #0x10]
    orreq r0, r0, #0x20000
    streq r0, [r4, #0x10]
    orrne r0, r0, #0x10000
    strne r0, [r4, #0x10]
    b .L_198
.L_17c:
    bl func_0201b7a0
    cmp r0, #0x4
    ldr r0, [r4, #0x10]
    orreq r0, r0, #0x8000
    streq r0, [r4, #0x10]
    orrne r0, r0, #0x4000
    strne r0, [r4, #0x10]
.L_198:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
