import React, { useState, useRef } from 'react';
import { Button, Form, Grid, Header, Message, Segment } from 'semantic-ui-react';
import 'semantic-ui-css/semantic.min.css';

const Login = () => {
  const emailRef = useRef(null); // Ref pour l'input d'email
  const passwordRef = useRef(null); // Ref pour l'input de mot de passe

  // Fonction de soumission du formulaire de connexion
  const handleSubmit = () => {
    // Utilisez emailRef.current.value et passwordRef.current.value pour accéder aux valeurs des champs de saisie
    const email = emailRef.current.value;
    const password = passwordRef.current.value;
    console.log('Email:', email);
    console.log('Password:', password);

    // Mettez ici la logique pour vérifier les informations de connexion et authentifier l'utilisateur
    // Vous pouvez utiliser des requêtes API, des appels à un serveur, etc.
  };

  return (
    <Grid textAlign="center" style={{ height: '100vh' }} verticalAlign="middle">
      <Grid.Column style={{ maxWidth: 450 }}>
        <Header as="h2" color="teal" textAlign="center">
          Connectez-vous à votre compte
        </Header>
        <Form size="large" onSubmit={handleSubmit}>
          <Segment stacked>
            <Form.Input
              fluid
              icon="user"
              iconPosition="left"
              placeholder="Adresse email"
              ref={emailRef} // Utilisation de la référence pour l'input d'email
            />
            <Form.Input
              fluid
              icon="lock"
              iconPosition="left"
              placeholder="Mot de passe"
              type="password"
              ref={passwordRef} // Utilisation de la référence pour l'input de mot de passe
            />

            <Button color="teal" fluid size="large" type="submit">
              Connexion
            </Button>
          </Segment>
        </Form>
        <Message>
          Nouveau sur notre plateforme? <a href="#">Créez un compte</a>
        </Message>
      </Grid.Column>
    </Grid>
  );
};

export default Login;
