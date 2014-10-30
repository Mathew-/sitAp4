<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title><?php echo $titulo; ?></title>
    <meta charset="iso-8859-1" />
    <link type="text/css" rel="stylesheet"
              href="<?php echo base_url(); ?>css/estilo.css"/>
</head>
<body>
    <!-- abre o formulário de cadastro -->
    <?php echo form_open('index.php/Usuarios/cadastrar', 'id="form-usuario"'); ?>
    <label for="nome">Nome:</label><br/>
    <input type="text" name="nome" value="<?php echo set_value('nome'); ?>"/>
    <div class="error"><?php echo form_error('nome'); ?></div>
    
    <label for="email">Email:</label><br/>
    <input type="text" name="email" value="<?php echo set_value('email'); ?>"/>
    <div class="error"><?php echo form_error('email'); ?></div>
    
    <label for="senha">Senha:</label><br/>
    <input type="password" name="senha" min="6" max="16" value="<?php echo set_value('senha'); ?>"/>
    <div class="error"><?php echo form_error('senha'); ?></div>
    
    <label for="sexo">Sexo:</label>
    <input type="text" name="sexo" value="<?php echo set_value('sexo'); ?>" />
    <div class="error"><?php echo form_error('sexo'); ?></div>
    
    <label for="cidade">Cidade:</label><br/>
    <input type="text" name="cidade" value="<?php echo set_value('cidade'); ?>"/>
    <div class="error"><?php echo form_error('cidade'); ?></div>
    
    <label for="estado">Estado:</label><br/>
    <input type="text" name="estado" value="<?php echo set_value('estado'); ?>"/>
    <div class="error"><?php echo form_error('estado'); ?></div>
    
    <label for="endereco">Endereço:</label><br/>
    <input type="text" name="endereco" value="<?php echo set_value('endereco'); ?>"/>
    <div class="error"><?php echo form_error('endereco'); ?></div>
    
    <label for="cep">CEP:</label><br/>
    <input type="cep" name="cep" value="<?php echo set_value('cep'); ?>"/>
    <div class="error"><?php echo form_error('cep'); ?></div>
    
    <label for="foto">URL da Foto:</label><br/>
    <input type="text" name="foto" value="<?php echo set_value('foto'); ?>"/>
    <div class="error"><?php echo form_error('foto'); ?></div>
    
    <input type="submit" name="cadastrar" value="Cadastrar" />
    <?php echo form_close(); ?>
    <!-- fecha o formulário de cadastro -->
    
    <ul>
    <?php foreach($usuarios as $usuario): ?>
    <li>
        <a title="deletar" href="<?php echo base_url() . 'index.php/Usuarios/deletar/' . $usuario->idusuario; ?>" onclick="return confirm('Confirma a exclusão deste registro?')">[X]</a>
        <span> - </span>
        <a title="alterar" href="<?php echo base_url() . 'index.php/Usuarios/editar/' . $usuario->idusuario; ?>">[E] <?php echo $usuario->nome; ?></a>
        <span> - </span>
        <span><?php echo $usuario->email; ?></span>
    </li>
    <?php endforeach ?>
</ul>
</body>
</html>