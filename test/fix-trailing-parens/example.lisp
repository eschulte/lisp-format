(deftest homologous-crossover-with-cut ()
  (with-fixture gcd-asm
    (let ((variant (copy *gcd*))
          (target 40)
          )
      ;; apply cut to variant
      (apply-mutation variant
                      (make-instance 'simple-cut
                        :object variant))
      )))
