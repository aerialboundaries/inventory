update t_guilty_list_newage
    SET inv_model_digest = (
        SELECT
        t_digest_newage.inv_model_digest
        FROM t_digest_newage WHERE t_guilty_list_newage.inv_month = t_digest_newage.inv_month
        and t_guilty_list_newage.inv_model = t_digest_newage.inv_model)
    WHERE EXISTS (select * from t_digest_newage WHERE t_guilty_list_newage.inv_month = t_digest_newage.inv_month
        and t_guilty_list_newage.inv_model = t_digest_newage.inv_model)