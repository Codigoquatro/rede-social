package models

type Publicacao struct {
	ID        uint64 `json:"id,omitempty"`
	Titulo    string `json:"titulo,omitempty"`
	Conteudo  string `json:"conteudo,omitempty"`
	AutorID   string `json:"autorId,omitempty"`
	AutorNick string `json:"autorNick,omitempty"`
	Curtidas  string `json:"curtidas"`
	CriadaEm  string `json:"criadaEm,omitempty"`
}
