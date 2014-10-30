<!-- abre o formulário de edição -->
<?php echo form_open('index.php/Usuarios/alterar', 'id="form-usuario"'); ?>
    <input type="hidden" name="id" value="<?php echo $dados_usuario[0]->idusuario; ?>"/>
    
    <label for="nome">Nome:</label><br/>
    <input type="text" name="nome" value="<?php echo $dados_usuario[0]->nome; ?>"/>
    <div class="error"><?php echo form_error('nome'); ?></div>
    

    <label for="email">Email:</label><br/>
    <input type="text" name="email" value="<?php $dados_usuario[0]->email; ?>"/>
    <div class="error"><?php echo form_error('email'); ?></div>
    

    <label for="senha">Senha:</label><br/>
    <input type="password" name="senha" min="6" max="16" value="<?php echo $dados_usuario[0]->senha; ?>"/>
    <div class="error"><?php echo form_error('senha'); ?></div>
    
   
    <label for="sexo">Sexo:</label>
    <input type="text" name="sexo" value="<?php echo $dados_usuario[0]->sexo; ?>" />
    <div class="error"><?php echo form_error('sexo'); ?></div>
    
   
    <label for="cidade">Cidade:</label><br/>
    <input type="text" name="cidade" value="<?php echo $dados_usuario[0]->cidade; ?>"/>
    <div class="error"><?php echo form_error('cidade'); ?></diecho set_value('cidade');v>
    
    
    <label for="estado">Estado:</label><br/>
    <input type="text" name="estado" value="<?php echo $dados_usuario[0]->estado; ?>"/>
    <div class="error"><?php echo form_error('estado'); ?></div>
    
    
    <label for="endereco">Endereço:</label><br/>
    <input type="text" name="endereco" value="<?php echo $dados_usuario[0]->endereco; ?>"/>
    <div class="error"><?php echo form_error('endereco'); ?></div>
    
   
    <label for="cep">CEP:</label><br/>
    <input type="cep" name="cep" value="<?php echo $dados_usuario[0]->cep; ?>"/>
    <div class="error"><?php echo form_error('cep'); ?></div>
    
    
    <label for="foto">URL da Foto:</label><br/>
    <input type="text" name="foto" value="<?php echo $dados_usuario[0]->foto; ?>"/>
    <div class="error"><?php echo form_error('foto'); ?></div>
    
    <input type="submit" name="alterar" value="Alterar" />
    <?php echo form_close(); ?>
<!-- fecha o formulário de edição -->

