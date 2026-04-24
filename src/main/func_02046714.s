; func_02046714: no-op stub — `bx lr` only.
;
; Ships as .s because a bare `bx lr` with no prologue/return-value
; setup doesn't come out of C (mwcc always emits some form of
; function-body wrapper).

        .text
        .global func_02046714
        .arm
func_02046714:
        bx      lr
